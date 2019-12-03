use std::error::Error;
use std::time::{Duration, Instant};

use log::*;

use purpledrop::{
    location::{yx, Location, Rectangle},
    purpledrop::{PurpleDrop, Settings},
};

#[derive(Debug, Clone, Copy)]
struct MyDuration(std::time::Duration);

impl std::str::FromStr for MyDuration {
    type Err = std::num::ParseFloatError;

    fn from_str(s: &str) -> Result<Self, Self::Err> {
        let float: f64 = s.parse()?;
        if float < 0.0 {
            panic!("Float should be non-negative");
        }
        Ok(MyDuration(Duration::from_secs_f64(float)))
    }
}

use structopt::StructOpt;

type RunResult<T> = Result<T, Box<dyn Error>>;
type SleepFn = dyn Fn(MyDuration) -> RunResult<()>;

#[derive(Debug, StructOpt)]
#[structopt(rename_all = "kebab-case")]
#[structopt(about = r#"env!("PD_TEST_ABOUT")"#)]
enum SubCommand {
    SetFrequency(SetFrequency),
    SetPin(SetPin),
    SetLoc(SetLoc),
    Circle(Circle),
    BackAndForth(BackAndForth),
    ToggleMask(ToggleMask),
    // Dac,
    // Pwm,
    // Temp,
    // Heat,
    // Pins,
}

static SIGNALS: &[i32] = &[signal_hook::SIGINT];

fn main() -> RunResult<()> {
    // enable logging
    let _ = env_logger::try_init();

    // set up the sleep function by registering a signal handler that
    // will catch a ctrl-c, stop the thread from sleeping, and return
    // an error
    let sleep = {
        let (signal_tx, signal_rx) = std::sync::mpsc::sync_channel(10);

        for &sig in SIGNALS {
            let tx = signal_tx.clone();
            let f = move || {
                if let Err(e) = tx.try_send(sig) {
                    eprintln!("Couldn't send a signal! {:?}", e);
                }
            };
            unsafe { signal_hook::register(sig, f) }.unwrap();
        }

        move |dur: MyDuration| match signal_rx.recv_timeout(dur.0) {
            Ok(sig) => {
                eprintln!("Got signal {}, closing...", sig);
                Err(format!("Got signal {}", sig).into())
            }
            Err(_timeout) => Ok(()),
        }
    };

    let sub = SubCommand::from_args();

    let conf_path = std::env::var("PD_CONFIG").map_err(|err| {
        eprintln!("Please set environment variable PD_CONFIG");
        err
    })?;
    println!("Using PD_CONFIG={}", conf_path);
    let settings = Settings::from_file(conf_path)?;
    debug!("Settings made!");

    let mut pd = PurpleDrop::new(settings)?;
    debug!("PurpleDrop made!");

    use SubCommand::*;
    match sub {
        SetFrequency(x) => x.run(&mut pd, &sleep),
        SetPin(x) => x.run(&mut pd, &sleep),
        SetLoc(x) => x.run(&mut pd, &sleep),
        Circle(x) => x.run(&mut pd, &sleep),
        BackAndForth(x) => x.run(&mut pd, &sleep),
        ToggleMask(x) => x.run(&mut pd, &sleep),
    }
}

#[derive(Debug, StructOpt)]
struct SetFrequency {
    frequency: f64,
    seconds: MyDuration,
}

impl SetFrequency {
    fn run(&self, pd: &mut PurpleDrop, sleep: &SleepFn) -> RunResult<()> {
        pd.set_frequency(self.frequency)?;
        sleep(self.seconds)
    }
}

#[derive(Debug, StructOpt)]
struct SetPin {
    pin: usize,
    #[structopt(default_value = "1")]
    seconds: MyDuration,
}

impl SetPin {
    fn run(&self, pd: &mut PurpleDrop, sleep: &SleepFn) -> RunResult<()> {
        let n = PurpleDrop::n_pins();
        if self.pin >= n {
            let s = format!("Pin out of bounds! Should be between 0 and {}.", n);
            return Err(s.into());
        }
        let mut pins = vec![false; n];
        pins[self.pin] = true;
        pd.output_pins(&pins);
        sleep(self.seconds)
    }
}

#[derive(Debug, StructOpt)]
struct SetLoc {
    location: Location,
    #[structopt(default_value = "(1,1)")]
    dimensions: Location,
    #[structopt(default_value = "1")]
    seconds: MyDuration,
}

impl SetLoc {
    fn run(&self, pd: &mut PurpleDrop, sleep: &SleepFn) -> RunResult<()> {
        let rects = &[Rectangle {
            location: self.location,
            dimensions: self.dimensions,
        }];
        pd.output_rects(rects);
        sleep(self.seconds)
    }
}

#[derive(Debug, StructOpt)]
struct Circle {
    location: Location,
    dimensions: Location,
    circle_size: Location,
    #[structopt(default_value = "1")]
    seconds: MyDuration,
}

impl Circle {
    fn run(&self, pd: &mut PurpleDrop, sleep: &SleepFn) -> RunResult<()> {
        let mut rects = vec![Rectangle {
            location: self.location,
            dimensions: self.dimensions,
        }];

        //     pd.output_pins(&rects);

        let mut set = |yo, xo| {
            let loc = self.location + yx(yo, xo);
            rects[0].location = loc;
            let start = Instant::now();
            pd.output_rects(&rects);
            print!("Droplet at {}...", loc);
            let res = sleep(self.seconds);
            println!("{:?}", start.elapsed());
            res
        };

        for xo in 0..self.circle_size.x {
            set(0, xo)?;
        }
        for yo in 0..self.circle_size.y {
            set(yo, self.circle_size.x - 1)?;
        }
        for xo in 0..self.circle_size.x {
            set(self.circle_size.y - 1, self.circle_size.x - 1 - xo)?;
        }
        for yo in 0..self.circle_size.y {
            set(self.circle_size.y - 1 - yo, 0)?;
        }

        Ok(())
    }
}

#[derive(Debug, StructOpt)]
#[structopt(rename_all = "kebab-case")]
struct BackAndForth {
    #[structopt(short, long, default_value = "2,2")]
    dimensions: Location,
    #[structopt(short, long, default_value = "3")]
    x_distance: i32,
    #[structopt(long, default_value = "1")]
    spacing: u32,
    #[structopt(long, default_value = "1,0")]
    starting_location: Location,
    #[structopt(short, long, default_value = "1")]
    n_droplets: u32,
    #[structopt(short, long, default_value = "1")]
    seconds: MyDuration,
    #[structopt(long, help = "additional seconds to stagger the movement of droplets")]
    stagger: Option<MyDuration>,
}

impl BackAndForth {
    fn run(&self, pd: &mut PurpleDrop, sleep: &SleepFn) -> RunResult<()> {
        let mut rects: Vec<_> = (0..self.n_droplets)
            .map(|i| {
                let y_offset = (self.dimensions.y + self.spacing as i32) * i as i32;
                let location = self.starting_location + yx(y_offset, 0);
                Rectangle {
                    location,
                    dimensions: self.dimensions,
                }
            })
            .collect();

        let xs: Vec<i32> = {
            let start = self.starting_location.x;
            let end = start + self.x_distance;
            assert!(end >= 0);

            if start < end {
                let xs = start..end;
                (xs.clone()).chain(xs.rev()).collect()
            } else {
                let xs = end..start;
                (xs.clone().rev()).chain(xs).collect()
            }
        };

        println!("Moving to x's: {:?}", xs);

        for x in xs {
            for i in 0..self.n_droplets {
                let rect = &mut rects[i as usize];
                rect.location.x = x as i32;
                if let Some(stagger) = self.stagger {
                    pd.output_rects(&rects);
                    sleep(stagger)?;
                }
            }
            pd.output_rects(&rects);
            let locs: Vec<_> = rects.iter().map(|d| d.location).collect();
            println!("Droplets at {:?}", locs);

            sleep(self.seconds)?;
        }

        Ok(())
    }
}

fn parse_hex(src: &str) -> Result<u128, std::num::ParseIntError> {
    u128::from_str_radix(src, 16)
}

#[derive(Debug, StructOpt)]
struct ToggleMask {
    #[structopt(parse(try_from_str = parse_hex), help="in hex, but no 0x prefix")]
    mask: u128,
    #[structopt(long, default_value = "1.0")]
    delay: MyDuration,
    #[structopt(long, short = "n", default_value = "10")]
    iterations: usize,
}

impl ToggleMask {
    fn run(&self, pd: &mut PurpleDrop, sleep: &SleepFn) -> RunResult<()> {
        let mut pins = vec![false; PurpleDrop::n_pins()];
        for i in 0..self.iterations {
            let flip = i & 1;
            for pin in 0..PurpleDrop::n_pins() {
                let bit = (self.mask >> (127 - pin)) & 1;
                pins[pin] = bit as usize == flip;
            }
            pd.output_pins(&pins);
            sleep(self.delay)?;
        }
        Ok(())
    }
}
