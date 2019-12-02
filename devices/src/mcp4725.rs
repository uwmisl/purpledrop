// https://cdn-shop.adafruit.com/datasheets/mcp4725.pdf
use rppal::i2c::I2c;
use serde::Deserialize;

use crate::error::Result;

// From Table 6.2
enum Command {
    WriteDac = 0b0100_0000,
    WriteDacAndEeprom = 0b1100_0000,
}

#[derive(Debug, Deserialize)]
pub struct Settings {
    pub bus: u8,
    pub address: u16,
}

impl Settings {
    pub fn make(&self) -> Result<Mcp4725> {
        let mut i2c = rppal::i2c::I2c::with_bus(self.bus)?;
        i2c.set_slave_address(self.address)?;

        let mut mcp = Mcp4725 { i2c };
        // write to initialize, but also to make sure `new` fails if
        // something is wrong with the i2c
        mcp.write(0)?;
        Ok(mcp)
    }
}

pub struct Mcp4725 {
    i2c: I2c,
}

impl Mcp4725 {
    pub fn write(&mut self, data: u16) -> Result<()> {
        self.do_write(data, Command::WriteDac)
    }

    pub fn write_and_save(&mut self, data: u16) -> Result<()> {
        self.do_write(data, Command::WriteDacAndEeprom)
    }

    fn do_write(&mut self, value: u16, cmd: Command) -> Result<()> {
        assert!(value < (1 << 12));
        let value_hi_8 = (value >> 4) as u8;
        let value_lo_4 = (value << 4) as u8;

        let written = self.i2c.write(&[cmd as u8, value_hi_8, value_lo_4])?;
        assert_eq!(written, 3);
        Ok(())
    }
}
