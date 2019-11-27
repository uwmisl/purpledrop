use purpledrop::httpserver::Server;
use structopt::StructOpt;

use log::*;

fn main() {
    debug!("");
    let _ = env_logger::try_init();
    let server = Server::from_args();
    debug!("Server parsed!");
    server.run().unwrap();
}
