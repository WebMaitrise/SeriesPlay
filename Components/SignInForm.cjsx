{Link} = ReactRouter

@SignInForm = React.createClass

  render: ->
    $ "div", {},
      $ "form", { onSubmit: @_submit },
        $ "input", { type: 'text', name: 'name', placeholder: 'Your name' }
        $ "input", { type: 'text', name: 'email', placeholder: 'Your email' }
        $ "input", { type: 'password', name: 'password', placeholder: 'Your Password' }
        $ "input", { type: 'submit' }

  _submit: (e) ->
    e.preventDefault()

    Accounts.createUser
      email: e.target.email.value
      password: e.target.password.value
      profile:
        name: e.target.name.value

      ReactRouter.browserHistory.push '/'
