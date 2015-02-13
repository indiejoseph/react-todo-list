/** @jsx React.DOM */

var React = require('React');

var ListInput = React.createClass({

	getDefaultProps: function() {
		return {
			onSubmit: function() {}
		};
	},

	render: function() {
		return (
			<div className="todo-item-input">
				// Use `...this.props` to pass props of this component to input
				<input ref="input" { ...this.props } onKeyDown={ this._handleKeyDown } />
			</div>
		);
	},

	_handleKeyDown: function(evt) {
		// Listen for an Enter key press event
		if (evt.keyCode === 13) {
			var input = this.refs['input'].getDOMNode()
			var val = input.value;

			// Trigger listener
			this.props.onSubmit(val);

			// Clear input
			input.value = '';
		}
	}

});

module.exports = ListInput;
