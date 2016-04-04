import {Router, IndexRoute, Redirect, Route, browserHistory} from 'react-router';
import Container from './pages/Main.jsx';
import Dashboard from './pages/Dashboard';
import Setting from './pages/Setting';
import NotFound from './pages/NotFound';


export default (<Router history={browserHistory}>
    <Route path="/" component={Container}>
        <Route path="dashboard" component={Dashboard}></Route>
        <Redirect path="/" to="dashboard"></Redirect>
        <Route path="setting" component={Setting}></Route>

        <Route path="*" component={NotFound}></Route>
    </Route>
</Router>);
