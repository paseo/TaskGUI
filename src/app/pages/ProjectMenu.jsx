import React from 'react';
import MenuItem from './ProjectMenuItem.jsx';


export default class ProjectMenu extends React.Component {


    render() {
        return <aside className="sidebar">
            <div className="listing-project">
                <div className="listing-wrap">
                    <ul className="list list-project">
                        {this.renderItems()}
                    </ul>
                </div>
            </div>
        </aside>
    }

    renderItems() {
        return this.state.items.map((item, i) => {
            return <MenuItem key={i} {...item}></MenuItem>;
        });
    }
}
