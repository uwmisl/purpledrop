
import jsonRpc from 'simple-jsonrpc-js';

// Hook-up transport for simple-jsonrpc-js
let rpc = new jsonRpc();
rpc.toStream = (msg) => {
    fetch('/rpc', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: msg,
    }).then(async (response) => {
        let body = await response.text();
        rpc.messageHandler(body);
    });
};

const Pd = {
    getBoardDefinition: () => {
        return rpc.call('get_board_definition');
    },
    setElectrodePins: (pins) => {
        // Send a list of activated pin numbers, e.g. [4, 2, 100] will enable
        // electrode outputs 4, 2, and 100 while disabling all others. 
        return rpc.call('set_electrode_pins', [pins]);
    },
};

export default Pd;