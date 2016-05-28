React = require 'react'
{Link} = require 'react-router'

SignInForm = React.createClass

	getInitialState: ->
		error: null

	render: ->

		error = $ "div", { className: 'error' }, @state.error

		$ "div", {},
			error,
			$ "form", { onSubmit: @_submit },
				$ "input", { type: 'text', name: 'name', placeholder: 'Your name' }
				$ "input", { type: 'text', name: 'email', placeholder: 'Your email' }
				$ "input", { type: 'password', name: 'password', placeholder: 'Your Password' }
				$ "input", { type: 'submit' }

	_submit: (e) ->
		e.preventDefault()

		user = Accounts.createUser
			email: e.target.email.value
			password: e.target.password.value
			profile:
				name: e.target.name.value
		, ( (error) ->
			if error
				@setState
					error: error.reason
			else
				ReactRouter.browserHistory.push '/'
		).bind @


module.exports = SignInForm