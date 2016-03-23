{Link} = ReactRouter

@LoginForm = React.createClass

  render: ->
    $ "div", {},
      $ "form", { onSubmit: @_submit },
        $ "input", { type: 'text', name: 'email' }
        $ "input", { type: 'password', name: 'password' }
        $ "input", { type: 'submit' }

      $ "button", { onClick: @_fb_login }, "Login with Facebook"
      $ "button", { onClick: @_twitter_login }, "Login with Twitter"

  _submit: (e) ->
    e.preventDefault()

    Meteor.loginWithPassword e.target.email.value, e.target.password.value, (error) ->
      if error
        console.log error.reason
      else
        ReactRouter.browserHistory.push '/'

  _fb_login: (e) ->
    e.preventDefault()

    Meteor.loginWithFacebook()

  _twitter_login: (e) ->
    e.preventDefault()

    Meteor.loginWithTwitter()
