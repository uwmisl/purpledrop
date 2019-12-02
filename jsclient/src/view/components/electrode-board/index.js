import './styles.scss';
import Pd from '../../../models/Pd';

export default function() {
    var board = null;
    var brushSize = 2;
    var hoverPositions = {};

    let handler = (e, position) => {
        let row = position[1];
        let col = position[0];
        console.log(`Clicked pin ${board.grid[row][col].pin} @ ${row}, ${col}`);
        if(!e.shiftKey) {
            board.deactivateAll();
        }
        for(var x=0; x<brushSize; x++) {
            for(var y=0; y<brushSize; y++) {
                board.activate(row+y, col+x);
            }
        }
        board.writeToDevice();
    };

    let move = (xdelta, ydelta) => {
        console.log('move: ', xdelta, ydelta);
        board.move(xdelta, ydelta);
        m.redraw();
        board.writeToDevice();
    };

    let onMouseOut = () => {
        hoverPositions = {};
    };

    let onMouseOver = (position) => {
        let row = position[1];
        let col = position[0];
        hoverPositions = {};
        for(var x=0; x<brushSize; x++) {
            for(var y=0; y<brushSize; y++) {
                hoverPositions[[col+x, row+y]] = true;
            }
        }
    };

    let createElectrode = (position, active, hover) => {
        let cstr = hover ? 'electrode hover' : (active ? 'electrode active' : 'electrode');
        const cornerOffset = 0.1;
        return <rect class={cstr} onmouseout={() => onMouseOut(position)} onmouseover={() => onMouseOver(position)} onclick={(e) => handler(e, position)} x={position[0]+cornerOffset} y={position[1]+cornerOffset} width={1.0-cornerOffset*2} height={1.0-cornerOffset*2} />;
    };

    function incrementBrushSize() {
        if(brushSize < 5) {
            brushSize++;
        }
    }

    function decrementBrushSize() {
        if(brushSize > 1) {
            brushSize--;
        }
    }


    return {
        oninit: function() {
            window.addEventListener('keydown', function (event) {
                if (event.defaultPrevented) {
                    return; // Do nothing if the event was already processed
                }
              
                switch (event.key) {
                case 'ArrowDown':
                    move(0, 1);
                    break;
                case 'ArrowUp':
                    move(0, -1);
                    break;
                case 'ArrowLeft':
                    move(-1, 0);
                    break;
                case 'ArrowRight':
                    move(1, 0);
                    break;
                default:
                    return; // Quit when this doesn't handle the key event.
                }
              
                // Cancel the default action to avoid it being handled twice
                event.preventDefault();
            }, true);
        },
        view: function(vnode) {
            let electrodeRects = [];
            board = vnode.attrs.board;
            for(let row=0; row < board.height; row++) {
                for(let col=0; col < board.width; col++) {
                    let cell = board.grid[row][col];
                    let position = [col, row];
                    if(cell.pin !== null) {
                        electrodeRects.push(createElectrode(position, cell.active, hoverPositions[position]));
                    }
                }
            }
            return <div>
                <div class="toolbar">
                    <button class="brushsize" onclick={() => decrementBrushSize()}>Smaller</button>
                    <input id="brushsize" type="text" disabled value={brushSize} name="brushsize" />
                    <button class="brushsize" onclick={() => incrementBrushSize()}>Bigger</button>
                </div>
                <div class='electrode-grid-wrapper'>
                    <svg class='electrode-grid' viewBox={`0 0 ${vnode.attrs.board.width} ${vnode.attrs.board.height}`}>
                        {electrodeRects}
                    </svg>
                </div>
            </div>;


            // return m('main', [
            //     m('h1', {
            //         class: 'title',
            //     }, 'My first component'),
            //     // changed the next line
            //     m('button', {
            //         onclick: function() {
            //             count++;
            //         },
            //     }, count + ' clicks'),
            // ]);
        },
    };
}