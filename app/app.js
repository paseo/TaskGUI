//todo 页面启动js文件
import React from 'react';
import ReactDOM from 'react-dom';
import _ from 'lodash';

_.assign(window, {React, ReactDOM, _});

import routes from './routes';
ReactDOM.render(routes, document.getElementById(id));
