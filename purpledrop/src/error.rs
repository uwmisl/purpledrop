
#[cfg(target_arch="arm")]
use devices::error::Error as DevicesError;
#[cfg(not(target_arch="arm"))]
use std::string::String as DevicesError;

#[derive(Debug)]
pub enum Error {
    Device(DevicesError),
}

impl std::error::Error for Error {}

pub type Result<T> = std::result::Result<T, Error>;

macro_rules! impl_error {
    ($inner:ty, $variant:ident) => {
        impl From<$inner> for Error {
            fn from(inner: $inner) -> Self {
                Error::$variant(inner)
            }
        }
    };
}

impl_error!(DevicesError, Device);

use std::fmt;

impl fmt::Display for Error {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            Error::Device(inner) => write!(f, "{}", inner),
        }
    }
}
