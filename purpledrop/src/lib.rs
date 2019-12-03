#![cfg_attr(not(target_arch = "arm"), allow(unused_imports))]
#![cfg_attr(not(target_arch = "arm"), allow(unused_variables))]
#![cfg_attr(not(target_arch = "arm"), allow(dead_code))]

pub mod board;
pub mod httpserver;
pub mod location;
pub mod purpledrop_rpc;

pub mod devices;
pub mod purpledrop;

#[cfg(target_arch = "arm")]
pub mod error;

#[cfg(not(target_arch = "arm"))]
pub mod error {
    pub type Error = Box<dyn std::error::Error>;
    pub type Result<T> = std::result::Result<T, Error>;
}
