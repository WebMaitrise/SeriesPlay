React = require 'react'
{Link} = require 'react-router'

LoginForm = React.createClass

	getInitialState: ->
		error: null

	render: ->

		if @state.error
			error = $ "div", { className: 'error' }, @state.error

		$ "div", {},
			error,
			$ "form", { onSubmit: @_submit },
				$ "input", { type: 'text', name: 'email' }
				$ "input", { type: 'password', name: 'password' }
				$ "input", { type: 'submit' }

			$ "button", { onClick: @_fb_login }, "Login with Facebook"
			$ "button", { onClick: @_twitter_login }, "Login with Twitter"

	_submit: (e) ->
		e.preventDefault()

		Meteor.loginWithPassword e.target.email.value, e.target.password.value, ( (error) ->
			if error
				@setState
					error: error.reason
			else
				ReactRouter.browserHistory.push '/'
		).bind @

	_fb_login: (e) ->
		e.preventDefault()

		Meteor.loginWithFacebook()

	_twitter_login: (e) ->
		e.preventDefault()

		Meteor.loginWithTwitter()


module.exports = LoginForm