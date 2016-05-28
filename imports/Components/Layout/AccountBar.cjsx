React = require 'react'
$ = React.createElement

{Link} = require 'react-router'

AccountBar = React.createClass

  mixins: [ ReactMeteorData ]

  getMeteorData: ->
    Meteor.subscribe 'users'

    currentUser: Accounts.users.findOne Meteor.userId()

  render: ->
    if @data.currentUser
      $ "div", {},
        "Welcome "+@data.currentUser.profile.name
        " | "
        $ Link, { to:'/account' }, "Mes Quizzes"
        " | "
        $ Link, { to:'/quizzes/new' }, "New Quizz"
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


module.exports = AccountBar