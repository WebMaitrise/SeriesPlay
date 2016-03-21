{Link} = ReactRouter

@Account = React.createClass
  render: ->
    <div>Votre compte {Meteor.userId()} <a href="#" onClick={this._logout}>Logout</a></div>

  _logout: ->
    Meteor.logout()
    ReactRouter.browserHistory.push '/'
