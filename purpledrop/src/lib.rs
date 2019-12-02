
//extern crate serde; 

pub mod error;
pub mod board;
pub mod httpserver;
pub mod location;
pub mod purpledrop;
#[cfg(not(target_arch="arm"))]
pub mod mockpurpledrop;
pub mod purpledrop_rpc;

