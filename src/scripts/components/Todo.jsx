/** @jsx React.DOM */

var React     = require('React/addons');
var ReactCSSTransitionGroup = React.addons.CSSTransitionGroup;
var ListItem  = require('./ListItem');
var ListInput = require('./ListInput');

var Todo = React.createClass({

	getInitialState: function() {
		return {
			listItems: [
				'Todo Item1',
				'Todo Item2'
			]
		};
	},

	render: function() {
		var list = this.state.listItems.map(function(item) {
			return (<li>
				<ListItem>{ item }</ListItem>
			</li>);
		});

		return (
			<div className="todo">
					<ul className="todo-list">
						<ReactCSSTransitionGroup transitionName="list-transition">
							{ list }
						</ReactCSSTransitionGroup>
					</ul>
					<ListInput autoFocus={ true } placeholder="What you gonna do?" onSubmit={ this._onInputSubmit } />
			</div>
		);
	},

	_onInputSubmit: function(val) {
		listItems = this.state.listItems;
		listItems.push(val);
		this.setState({ listItems: listItems });
	}

});

module.exports = Todo;
