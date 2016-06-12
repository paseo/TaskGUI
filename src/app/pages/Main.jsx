import React from 'react';
import Console from './Console';


export default class Main extends React.Component {

    render() {
        return <section id="main" className="container">
            {this.props.children}

            <Console></Console>
        </section>;
    }
}
