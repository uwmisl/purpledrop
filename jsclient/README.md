# PurpleDrop Control Interface

This is a javascript app, created with mithril, to provide a simple UI for visually controlling the electrodes on the purple drop. You can activate electrodes by choosing a "brush size", and clicking on the electrode array where you'd like to activate. Shift clicking will activate the new electrodes without deactivating old electrodes. Use the arrow keys to move the currently activated electrode pattern. 

The client communicates with the `pdd` rust executable. 

## Installing on the raspberry PI

Building the webpack bundle requires node, and yarn (or npm). 

To install dependencies: 

`yarn install`

To build the distribution bundle:

`yarn build`

Now you can install everything generated in the `jsclient/dist` directory onto the pi, in whatever directory you prefer. For example: 

`scp -r dist/* purpledrop:/var/www/purpledrop`

The jsclient uses the rust executable `pdd` as a back-end server, and it will also serve the `dist` directory you installed above. For example:

`sudo RUST_LOG=debug ~/pdd --config ~/purpledrop.toml --address 0.0.0.0:80 --static /var/www/purpledrop`
