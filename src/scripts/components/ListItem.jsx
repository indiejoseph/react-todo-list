/** @jsx React.DOM */

var React = require('React');
var ReactCSSTransitionGroup = React.addons.CSSTransitionGroup;

var ListItem = React.createClass({

	getInitialState: function() {
		return {
			checked: false
		};
	},

	render: function() {
		var throughElement = null;

		if(this.state.checked) {
			throughElement = (<div className="todo-list-item-through" />);
		}

		return (
			<div className="todo-list-item" onClick={ this._onClickHandler }>

				<div className="todo-list-item-check">
					<input type="checkbox" checked={ this.state.checked } />
				</div>

				<div className="todo-list-item-text" >
					{ this.props.children }
					<ReactCSSTransitionGroup transitionName="through-transition">
						{ throughElement }
					</ReactCSSTransitionGroup>
				</div>

			</div>
		);
	},

	_onClickHandler: function(evt) {
		this.setState({ checked: !this.state.checked });
	}

});

module.exports = ListItem;
