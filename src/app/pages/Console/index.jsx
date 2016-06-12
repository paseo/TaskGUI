import React from 'react';
import Reflux from 'reflux';
import store from './store';


//todo 绑定store,日志渲染

export default React.createClass({
    displayName: 'Console',
    mixins: [Reflux.connect(store)],
    render() {
        return <div className="overlay overlay-log">
            <pre className="overlay-main"></pre>
            <a href="javascript:void(0);" className="overlay-close"><i className="icon icon-cancel"></i></a>
        </div>;
    }
});
