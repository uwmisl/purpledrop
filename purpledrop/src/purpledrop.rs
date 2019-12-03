use crate::error::Result;
use crate::location::{Location, Rectangle};
use crate::{board::Board, devices};

use log::*;
use serde::Deserialize;
use std::path::Path;
type BoxedStdError = Box<dyn std::error::Error>;
type StdResult<T, E = BoxedStdError> = std::result::Result<T, E>;

#[derive(Debug, Deserialize)]
pub struct Settings {
    pub board: crate::board::Board,
    pub hv507: devices::hv507::Settings,
    pub mcp4725: Option<devices::mcp4725::Settings>,
    pub pca9685: Option<devices::pca9685::Settings>,
    pub max31865: Option<devices::max31865::Settings>,
}

impl Settings {
    pub fn from_file(path: impl AsRef<Path>) -> StdResult<Self> {
        let s = std::fs::read_to_string(path).expect("Couldn't read config file");
        Ok(toml::from_str(&s)?)
    }
}

#[cfg(not(target_arch = "arm"))]
pub struct PurpleDrop {
    pub board: Board,
}

#[cfg(target_arch = "arm")]
pub struct PurpleDrop {
    pub board: Board,
    pub hv507: devices::hv507::Hv507,
    pub mcp4725: Option<devices::mcp4725::Mcp4725>,
    pub pca9685: Option<devices::pca9685::Pca9685>,
    pub max31865: Option<devices::max31865::Max31865>,
}

impl PurpleDrop {
    pub fn new(settings: Settings) -> Result<PurpleDrop> {
        trace!("Initializing purpledrop...");
        let pd = PurpleDrop {
            board: settings.board.clone(),
            #[cfg(target_arch = "arm")]
            hv507: settings.hv507.make()?,
            #[cfg(target_arch = "arm")]
            mcp4725: settings.mcp4725.map(|s| s.make()).transpose()?,
            #[cfg(target_arch = "arm")]
            pca9685: settings.pca9685.map(|s| s.make()).transpose()?,
            #[cfg(target_arch = "arm")]
            max31865: settings.max31865.map(|s| s.make()).transpose()?,
        };
        trace!("Initialized purpledrop!");

        Ok(pd)
    }

    /// Returns the number of electrodes supported by purple drop hardware
    pub fn n_pins() -> usize {
        128
    }

    /// Set the electrode drive frequency
    ///
    /// # Arguments
    ///
    /// * `f` - Floating point frequency in Hz
    pub fn set_frequency(&mut self, f: f64) -> Result<()> {
        #[cfg(target_arch = "arm")]
        self.hv507.set_polarity(f)?;
        Ok(())
    }

    // pub fn heat(
    //     &mut self,
    //     _heater: &Peripheral,
    //     _target_temperature: f64,
    //     _duration: Duration,
    // ) -> Result<()> {
    //     unimplemented!()
    //     // // FIXME: for now, this simply blocks

    //     // let pwm_channel = if let Peripheral::Heater { pwm_channel, .. } = heater {
    //     //     *pwm_channel
    //     // } else {
    //     //     panic!("Peripheral wasn't a heater!: {:#?}", heater)
    //     // };

    //     // let mut pid = PidController::default();
    //     // pid.p_gain = 1.0;
    //     // pid.i_gain = 1.0;
    //     // pid.d_gain = 1.0;

    //     // use std::env;

    //     // pid.p_gain = env::var("PID_P").unwrap_or("1.0".into()).parse().unwrap();
    //     // pid.i_gain = env::var("PID_I").unwrap_or("1.0".into()).parse().unwrap();
    //     // pid.d_gain = env::var("PID_D").unwrap_or("1.0".into()).parse().unwrap();

    //     // pid.i_min = 0.0;
    //     // pid.i_max = pca9685::DUTY_CYCLE_MAX as f64;

    //     // pid.out_min = 0.0;
    //     // pid.out_max = pca9685::DUTY_CYCLE_MAX as f64;

    //     // pid.target = target_temperature;

    //     // let epsilon = 2.0; // degrees C
    //     // let extra_delay = Duration::from_millis(20);

    //     // let mut timer = Timer::new();
    //     // let mut in_range_start: Option<Instant> = None;

    //     // for iteration in 0.. {
    //     //     // stop if we've been in the desired temperature range for long enough
    //     //     if in_range_start
    //     //         .map(|t| t.elapsed() > duration)
    //     //         .unwrap_or(false)
    //     //     {
    //     //         break;
    //     //     }

    //     //     // FIXME HACK the mcp thing is bad here
    //     //     self.mcp4725.write(0).unwrap();
    //     //     thread::sleep(Duration::from_millis(30));
    //     //     let measured = self.max31865.read_one_temperature()? as f64;
    //     //     self.mcp4725.write(1600).unwrap();

    //     //     let dt = timer.lap();
    //     //     let mut duty_cycle = pid.update(measured, &dt);

    //     //     debug!(
    //     //         "Heating to {}*C... iteration: {}, measured: {}*C, duty_cycle: {}",
    //     //         target_temperature, iteration, measured, duty_cycle
    //     //     );

    //     //     if measured - target_temperature > epsilon {
    //     //         self.pca9685.set_duty_cycle(pwm_channel, 0)?;
    //     //         warn!(
    //     //             "We overshot the target temperature. Wanted {}, got {}",
    //     //             target_temperature, measured
    //     //         );
    //     //         duty_cycle = 0.0;
    //     //     }

    //     //     if (target_temperature - measured).abs() < epsilon && in_range_start.is_none() {
    //     //         in_range_start = Some(Instant::now())
    //     //     }

    //     //     assert!(0.0 <= duty_cycle);
    //     //     assert!(duty_cycle <= pca9685::DUTY_CYCLE_MAX as f64);
    //     //     self.pca9685
    //     //         .set_duty_cycle(pwm_channel, duty_cycle as u16)?;

    //     //     thread::sleep(extra_delay);
    //     // }

    //     // self.pca9685.set_duty_cycle(pwm_channel, 0)?;

    //     // Ok(())
    // }

    // pub fn get_temperature(&mut self, _temp_sensor: Peripheral) -> Result<f32> {
    //     unimplemented!()
    //     // if let Peripheral::Heater { spi_channel, .. } = temp_sensor {
    //     //     // right now we can only work on the one channel
    //     //     assert_eq!(spi_channel, 0);
    //     //     self.max31865.read_temperature()
    //     // } else {
    //     //     panic!("Not a temperature sensor!: {:#?}")
    //     // }
    // }
    pub fn output_pins(&mut self, pins: &[bool]) {
        let n = Self::n_pins();
        assert_eq!(pins.len(), n);

        debug!("Setting pins: {:?}", pins);

        #[cfg(target_arch = "arm")]
        {
            self.hv507.clear_pins();
            for (i, on) in pins.iter().enumerate() {
                if *on {
                    self.hv507.set_pin_hi(i);
                }
            }

            self.hv507.shift_and_latch();
        }
    }

    pub fn output_locations(&mut self, locations: &[Location]) {
        let n = self.board.layout.n_pins();
        let mut pins = vec![false; n];

        for loc in locations {
            let pin_num = self
                .board
                .layout
                .get_pin(*loc)
                .unwrap_or_else(|| panic!("No pin at location: {}", loc));
            pins[pin_num] = true;
        }

        self.output_pins(&pins);
    }

    pub fn output_rects(&mut self, rects: &[Rectangle]) {
        let locs: Vec<_> = rects.iter().flat_map(|r| r.clone().locations()).collect();
        self.output_locations(&locs)
    }

    // pub fn input(&mut self, _input_port: &Peripheral, _volume: f64) -> Result<()> {
    //     unimplemented!()
    //     //     let pwm_channel = if let Peripheral::Input { pwm_channel, .. } = input_port {
    //     //         *pwm_channel
    //     //     } else {
    //     //         panic!("Peripheral wasn't an input port!: {:#?}", input_port)
    //     //     };

    //     //     let pump_duty_cycle = pca9685::DUTY_CYCLE_MAX / 2;

    //     //     let pump_duration = {
    //     //         // n.b. max flow rate is .45 ml/min +/- 15% at 20 C, or 7.5 ul/s
    //     //         let ul_per_second = 7.0;
    //     //         let ul_per_volume = 1.0;
    //     //         let seconds = volume * ul_per_volume / ul_per_second;
    //     //         seconds_duration(seconds)
    //     //     };

    //     //     self.pca9685.set_duty_cycle(pwm_channel, pump_duty_cycle)?;
    //     //     thread::sleep(pump_duration);
    //     //     self.pca9685.set_duty_cycle(pwm_channel, 0)?;
    //     //     Ok(())
    // }

    // pub fn output(&mut self, _output_port: &Peripheral, _volume: f64) -> Result<()> {
    //     unimplemented!()
    //     //     let pwm_channel = if let Peripheral::Output { pwm_channel, .. } = output_port {
    //     //         *pwm_channel
    //     //     } else {
    //     //         panic!("Peripheral wasn't an output port!: {:#?}", output_port)
    //     //     };

    //     //     let pump_duty_cycle = pca9685::DUTY_CYCLE_MAX / 2;

    //     //     let pump_duration = {
    //     //         // n.b. max flow rate is .45 ml/min +/- 15% at 20 C, or 7.5 ul/s
    //     //         let ul_per_second = 4.0;
    //     //         let ul_per_volume = 4.0;
    //     //         let seconds = volume * ul_per_volume / ul_per_second;
    //     //         seconds_duration(seconds)
    //     //     };

    //     //     self.pca9685.set_duty_cycle(pwm_channel, pump_duty_cycle)?;
    //     //     thread::sleep(pump_duration);
    //     //     self.pca9685.set_duty_cycle(pwm_channel, 0)?;
    //     //     Ok(())
    // }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn make_purpledrop_settings() {
        let _ = Settings::from_file("config/default.toml").unwrap();
    }
}
