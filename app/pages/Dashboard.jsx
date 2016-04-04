import React from 'react';
import ProjectMenu from './ProjectMenu';


export default React.createClass({

    render() {
        return <div>
            <ProjectMenu></ProjectMenu>

            {this.props.children}
        </div>;
    }
});
