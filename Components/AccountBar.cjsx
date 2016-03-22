{Link} = ReactRouter

@AccountBar = React.createClass

  mixins: [ ReactMeteorData ]

  getMeteorData: ->
    currentUser: Meteor.user()

  render: ->
    if @data.currentUser
      $ "div", {},
        "Welcome "+@data.currentUser.emails[0].address
        " | "
        $ Link, { to:'/account' }, "Mes Quizzes"
        " | "
        $ "a", { href:'#', onClick: @_logout }, "Logout"
    else
      $ "div", {},
        $ Link, { to: '/login' }, "Login"
        " | "
        $ Link, { to: '/signin' }, "Signin"

  _logout: (e) ->
    e.preventDefault()

    Meteor.logout()
    ReactRouter.browserHistory.push '/'
