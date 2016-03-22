{Link} = ReactRouter

@AccountBar = React.createClass

  mixins: [ ReactMeteorData ]

  getMeteorData: ->
    currentUser: Meteor.user()

  render: ->
    if @data.currentUser
      <MyQuizzes />
    else
      <LoginForm />
