macro_rules! impl_error {
    ($error:ident, $inner:ty, $variant:ident) => {
        impl From<$inner> for $error {
            fn from(inner: $inner) -> Self {
                $error::$variant(inner)
            }
        }
    };
}

#[derive(Debug)]
pub enum Error {
    Gpio(rppal::gpio::Error),
    I2c(rppal::i2c::Error),
    Pwm(rppal::pwm::Error),
    Spi(rppal::spi::Error),
    InvalidPwmChannel(u8),
}

impl std::error::Error for Error {}

pub type Result<T> = std::result::Result<T, Error>;

impl_error!(Error, rppal::gpio::Error, Gpio);
impl_error!(Error, rppal::i2c::Error, I2c);
impl_error!(Error, rppal::pwm::Error, Pwm);
impl_error!(Error, rppal::spi::Error, Spi);

use std::fmt;

impl fmt::Display for Error {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            Error::Gpio(inner) => write!(f, "{}", inner),
            Error::I2c(inner) => write!(f, "{}", inner),
            Error::Pwm(inner) => write!(f, "{}", inner),
            Error::Spi(inner) => write!(f, "{}", inner),
            Error::InvalidPwmChannel(chan) => write!(f, "Invalid PWM channel: {}", chan),
        }
    }
}
