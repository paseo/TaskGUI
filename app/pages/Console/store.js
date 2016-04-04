import action from './action';
import Reflux from 'reflux';

Reflux.createStore({
    listenables: action,

    onLog() {
        //todo
    },

    onError() {
        //todo
    },

    onWarn() {
        //todo
    }

});



