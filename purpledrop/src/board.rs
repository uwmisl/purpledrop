use serde::{
    de::{self, Deserializer},
    Deserialize, Serialize,
};

use std::convert::TryInto;
use std::fmt;
use std::num::ParseIntError;
use std::str::FromStr;

use crate::location::Location;

#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct Board {
    pub layout: Layout,
}

#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct Layout {
    pins: Vec<Vec<Option<usize>>>,
}

impl Layout {
    pub fn get_pin(&self, loc: Location) -> Option<usize> {
        let y: usize = loc.y.try_into().ok()?;
        let x: usize = loc.x.try_into().ok()?;
        let row = self.pins.get(y)?;
        row.get(x)?.clone()
    }

    pub fn n_pins(&self) -> usize {
        self.pins
            .iter()
            .flat_map(|row| row.iter().copied())
            .filter_map(|x| x)
            .max()
            .map(|n| n + 1)
            .unwrap_or(0)
    }
}

#[derive(Debug)]
pub struct ParseLayoutError {
    row: usize,
    col: usize,
    err: ParseIntError,
    s: String,
}

impl fmt::Display for ParseLayoutError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(
            f,
            "While parsing ({}, {}): {}",
            self.row, self.col, self.err
        )
    }
}

fn parse_pin(row: usize, col: usize, s: &str) -> Result<Option<usize>, ParseLayoutError> {
    let s = s.trim();
    if s.is_empty() {
        Ok(None)
    } else {
        s.parse().map(Some).map_err(|err| {
            let s = s.into();
            ParseLayoutError { row, col, err, s }
        })
    }
}

impl FromStr for Layout {
    type Err = ParseLayoutError;
    fn from_str(s: &str) -> Result<Self, Self::Err> {
        let pins: Result<Vec<Vec<Option<usize>>>, ParseLayoutError> = s
            .lines()
            .filter(|l| !l.chars().all(|c| c.is_whitespace()))
            .enumerate()
            .map(|(i, line)| {
                line.split(',')
                    .enumerate()
                    .map(|(j, s)| parse_pin(i, j, s))
                    .collect()
            })
            .collect();

        Ok(Layout { pins: pins? })
    }
}

impl<'de> Deserialize<'de> for Layout {
    fn deserialize<D>(deserializer: D) -> Result<Self, D::Error>
    where
        D: Deserializer<'de>,
    {
        let s = String::deserialize(deserializer)?;
        FromStr::from_str(&s).map_err(de::Error::custom)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_layout_parse() {
        let s = r#"
          0, 3, 2,  , 1
          8, 6, 7, 9,
        "#;
        let layout: Layout = s.parse().unwrap();
        assert_eq!(
            layout,
            Layout {
                pins: vec![
                    vec![Some(0), Some(3), Some(2), None, Some(1)],
                    vec![Some(8), Some(6), Some(7), Some(9), None],
                ],
            }
        );
    }
}
