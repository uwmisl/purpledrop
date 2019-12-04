use std::error::Error;

use jsonrpc_core::IoHandler;
use jsonrpc_http_server::{
    hyper::{Body, Method, Request, Response},
    RequestMiddlewareAction, ServerBuilder,
};

use crate::purpledrop::Settings;

use hyper_staticfile::Static;
use structopt::StructOpt;

use futures::Future;

use crate::purpledrop_rpc::{PurpleDropRpc, Rpc};

use log::*;

#[derive(StructOpt, Debug)]
pub struct Server {
    #[structopt(long = "address", default_value = "0.0.0.0:80")]
    address: std::net::SocketAddr,
    #[structopt(long = "threads", default_value = "4")]
    threads: usize,
    #[structopt(long = "static", default_value = "/usr/share/purpledrop/webroot")]
    static_dir: String,
    #[structopt(long = "config", default_value = "/etc/purpledrop/default.toml")]
    config_file: String,
}

fn serve(req: Request<Body>, statik: &Static) -> RequestMiddlewareAction {
    let path = req.uri().path();

    trace!("{:?}", req);

    if path.contains("..") {
        warn!("Found '..' in path!");
        return Response::builder()
            .status(404)
            .body("cannot have '..' in path".into())
            .unwrap()
            .into();
    }

    let method = req.method();
    match (path, method) {
        ("/status", _) => {
            debug!("returning status ok");
            Response::new("Server running OK.".into()).into()
        }
        ("/rpc", _) => {
            debug!("rpc");
            req.into()
        }
        (_, &Method::GET) => match statik.serve(req).wait() {
            Ok(resp) => {
                debug!("returning static file");
                resp.into()
            }
            Err(err) => {
                debug!("failed getting static file");
                Response::builder()
                    .status(404)
                    .body(format!("{:#?}", err).into())
                    .unwrap()
                    .into()
            }
        },
        _ => {
            warn!("bad request");
            Response::builder()
                .status(404)
                .body(format!("{:#?}", req).into())
                .unwrap()
                .into()
        }
    }
}

impl Server {
    pub fn run(&self) -> std::result::Result<(), Box<dyn Error>> {
        debug!("config_file: {}", self.config_file);
        debug!("static_dir: {}", self.static_dir);
        debug!("threads: {}", self.threads);
        debug!("address: {}", self.address);

        let settings = Settings::from_file(&self.config_file)?;
        debug!("Settings made!");

        let purpledrop = PurpleDropRpc::new(settings)?;

        debug!("PurpleDrop created.");

        let mut io = IoHandler::default();
        io.extend_with(purpledrop.to_delegate());

        debug!("IoHandler created.");

        let statik = Static::new(&self.static_dir);

        let server = ServerBuilder::new(io)
            .threads(self.threads)
            .request_middleware(move |req| serve(req, &statik))
            .start_http(&self.address)
            .expect("Unable to start RPC server");

        debug!("Server created.");

        server.wait();

        info!("Shutting down");
        Ok(())
    }
}

#[cfg(test)]
mod tests {

    use super::*;

    #[test]
    fn test_parse() {
        let args = "progname --static dir/ --address 1.2.3.4:9999 --grid dir/file.ext --threads 12";
        Server::from_iter(args.split_whitespace());
    }
}
