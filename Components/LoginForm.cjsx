{Link} = ReactRouter

@LoginForm = React.createClass

  render: ->
    <div>
      <form onSubmit={this._submit}>
        <input type="text" name="email" />
        <input type="password" name="password" />
        <input type="submit" />
      </form>
    </div>
  
  _submit: (e) ->
    e.preventDefault()

    Meteor.loginWithPassword e.target.email.value, e.target.password.value, (error) ->
      if error
        console.log error.reason
      else
        ReactRouter.browserHistory.push '/'
