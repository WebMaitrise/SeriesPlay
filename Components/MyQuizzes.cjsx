{Link} = ReactRouter

@MyQuizzes = React.createClass
  mixins: [ ReactMeteorData ]

  getMeteorData: ->
    quizzes: Quizzes.find({ owner: Meteor.userId() }).fetch()

  componentWillMount: ->
    Meteor.subscribe 'quizzes'
    Meteor.subscribe 'users'

  render: ->
    quizzes = @data.quizzes.map (quizz) ->
      <MyQuizzItem key={quizz._id._str} data={quizz} />

    <div>
      <h2>Mes quizzes</h2>

      <ul>
        {quizzes}
      </ul>

      <a href="#" onClick={this._logout}>Logout</a>
    </div>

  _logout: (e) ->
    e.preventDefault()

    Meteor.logout()
    ReactRouter.browserHistory.push '/'
