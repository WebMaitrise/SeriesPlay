{Link} = ReactRouter

@Account = React.createClass
  mixins: [ ReactMeteorData ]

  getMeteorData: ->
    quizzes: Quizzes.find({ owner: Meteor.userId() }).fetch()

  componentWillMount: ->
    Meteor.subscribe 'quizzes'
  render: ->
    quizzes = @data.quizzes.map (quizz) ->
      <li>{quizz.test}</li>

    <div>
      <div>Votre compte {Meteor.userId()} <a href="#" onClick={this._logout}>Logout</a></div>
      <h2>Mes Quizz</h2>
      <ul>{quizzes}</ul>
    </div>

  _logout: ->
    Meteor.logout()
    ReactRouter.browserHistory.push '/'
