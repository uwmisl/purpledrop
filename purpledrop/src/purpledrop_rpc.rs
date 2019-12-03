use jsonrpc_core::{Error, ErrorCode};
use jsonrpc_derive::rpc;
use std::sync::{Arc, Mutex};

use crate::purpledrop::PurpleDrop;
use crate::purpledrop::Settings;

use crate::board::Board;

use crate::error::Result;

pub struct RpcError(i32);

type RpcResult<T> = std::result::Result<T, RpcError>;

impl From<i32> for RpcError {
    fn from(p_err: i32) -> Self {
        Self(p_err)
    }
}

impl From<RpcError> for Error {
    fn from(p_err: RpcError) -> Self {
        let code = ErrorCode::ServerError(0);
        let mut err = Error::new(code);
        err.message = format!("PuddleError: {:?}", p_err.0);
        err
    }
}

pub struct PurpleDropRpc {
    purpledrop: Arc<Mutex<PurpleDrop>>,
}

impl PurpleDropRpc {
    pub fn new(settings: Settings) -> Result<PurpleDropRpc> {
        let new_rpc = PurpleDropRpc {
            purpledrop: Arc::new(Mutex::new(PurpleDrop::new(settings)?)),
        };
        Ok(new_rpc)
    }
}

#[rpc(server)]
pub trait Rpc {
    #[rpc(name = "get_board_definition")]
    fn get_board_definition(&self) -> RpcResult<Board>;
    #[rpc(name = "set_electrode_pins")]
    fn set_electrode_pins(&self, pins: Vec<u32>) -> RpcResult<()>;
}

impl Rpc for PurpleDropRpc {
    fn get_board_definition(&self) -> RpcResult<(Board)> {
        let arc = self.purpledrop.clone();
        let pd = arc.lock().unwrap();
        Ok(pd.board.clone())
    }

    fn set_electrode_pins(&self, pins: Vec<u32>) -> RpcResult<()> {
        let mut pin_array = vec![false; PurpleDrop::n_pins()];
        for pin in pins {
            pin_array[pin as usize] = true;
        }
        let arc = self.purpledrop.clone();
        let mut pd = arc.lock().unwrap();
        pd.output_pins(&pin_array);
        Ok(())
    }
}
