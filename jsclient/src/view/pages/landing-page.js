import ElectrodeBoard from '../components/electrode-board';
import BoardConfig from '../../models/BoardConfig';

export default function() {
    return {        
        view() {
            return (
                <div>
                    <h2>Purple Drop</h2>
                    <p>On the fly drop control</p>
                    <ElectrodeBoard board={BoardConfig.board} />
                </div>
            );
        },
    };
}