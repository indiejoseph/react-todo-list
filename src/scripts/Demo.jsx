/** @jsx React.DOM */

var React = require('React/addons');
var Todo = require('./components/Todo');

window.React = React; // Needed for React Developer Tools.

var DemoApp = React.createClass({

	displayName: 'DemoApp', // For debug message

	render: function() {
		return (<Todo/>);
	}
});

React.render(<DemoApp className="demo-app" />, document.getElementById('app'));
