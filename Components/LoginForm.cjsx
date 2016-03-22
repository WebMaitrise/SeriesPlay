{Link} = ReactRouter

@LoginForm = React.createClass

  render: ->
    $ "div", {},
      $ "form", { onSubmit: @_submit },
        $ "input", { type: 'text', name: 'email' }
        $ "input", { type: 'password', name: 'password' }
        $ "input", { type: 'submit' }

  _submit: (e) ->
    e.preventDefault()

    Meteor.loginWithPassword e.target.email.value, e.target.password.value, (error) ->
      if error
        console.log error.reason
      else
        ReactRouter.browserHistory.push '/'
