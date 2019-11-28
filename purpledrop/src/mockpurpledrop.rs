use std::path::Path;

use crate::location::{Location, Rectangle};
use crate::error::{Result};
use crate::board;

use serde::Deserialize;

use log::*;

type BoxedStdError = Box<dyn std::error::Error>;
type StdResult<T, E = BoxedStdError> = std::result::Result<T, E>;

#[derive(Debug, Deserialize)]
pub struct MockSettings {
    pub board: board::Board,
}

impl MockSettings {
    pub fn from_file(path: impl AsRef<Path>) -> StdResult<Self> {
        let s = std::fs::read_to_string(path).expect("Couldn't read config file");
        Ok(toml::from_str(&s)?)
    }
}

pub struct MockPurpleDrop {
    pub board: board::Board
}

impl MockPurpleDrop {
    pub fn new(settings: MockSettings) -> Result<MockPurpleDrop> {
        return Ok(MockPurpleDrop{board: settings.board});
    }

    pub fn n_pins() -> usize {
        128
    }

    pub fn set_frequency(&self, _f: f64) -> Result<()> {
        //noop
        Ok(())
    }

    pub fn output_pins(&mut self, pins: &[bool]) {
        debug!("MockPurpleDrop::output_pins: {:?}", pins)
    }

    pub fn output_locations(&mut self, _locations: &[Location]) {
    }

    pub fn output_rects(&mut self, _rects: &[Rectangle]) {
    }
}

