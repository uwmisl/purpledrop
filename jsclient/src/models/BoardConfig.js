import Pd from './Pd';

class Board {
    constructor(config) {
        this.height = config.layout.pins.length;
        this.width = 0;
        config.layout.pins.forEach((row) => { 
            if(row.length > this.width) {
                this.width = row.length;
            }
        });
        this.grid = config.layout.pins.map((row) => {
            return row.map((elem) => {
                let pin = parseInt(elem);
                if(isNaN(pin)) {
                    return {
                        pin: null,
                        active: false,
                    };
                } else {
                    return {
                        pin: pin,
                        active: false,
                    };
                }
            });
        });
    }

    deactivateAll() {
        this.grid.forEach((row) => {
            row.forEach((elem) => {
                elem.active = false;
            });
        });
    }

    activate(row, col) {
        this.grid[row][col].active = true;
    }

    writeToDevice() {
        let activePins = [];
        for(var row=0; row<this.height; row++) {
            for(var col=0; col<this.width; col++) {
                if(this.grid[row][col].active) {
                    activePins.push(this.grid[row][col].pin);
                }
            }
        }
        Pd.setElectrodePins(activePins);
    }

    /* Activate electrodes at an offset from each currently active electrode */
    move(xdelta, ydelta) {
        let activePositions = [];
        for(var row=0; row<this.height; row++) {
            for(var col=0; col<this.width; col++) {
                if(this.grid[row][col].active) {
                    activePositions.push([row, col]);
                }
            }
        }
        this.deactivateAll();
        activePositions.forEach((p) => {
            let newRow = p[0] + ydelta;
            let newCol = p[1] + xdelta;
            console.log(p);
            console.log(newRow, newCol);
            if(newRow < 0 || newCol < 0 || newRow >= this.height || newCol >= this.width) {
                return;
            }
            if(this.grid[newRow][newCol].pin === null) {
                // No electrode at this coordinate, so we drop it
                return;
            }
            this.activate(newRow, newCol);
        });
    }
}

const BoardConfig = {
    config: {},
    loadConfig: () => {
        return Pd.getBoardDefinition()
            .then((result) => {
                BoardConfig.config = result;
                BoardConfig.board = new Board(BoardConfig.config);
            });
    },
    board: null,
};

export default BoardConfig;