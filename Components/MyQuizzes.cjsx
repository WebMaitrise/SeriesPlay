{Link} = ReactRouter

@MyQuizzes = React.createClass
  mixins: [ ReactMeteorData ]

  getMeteorData: ->
    quizzes: Quizzes.find({ owner: Meteor.userId() }).fetch()

  componentDidMount: ->
    Meteor.subscribe 'quizzes'

  render: ->
    quizzes = @data.quizzes.map (quizz) ->
      $ MyQuizzItem, { key:quizz._id, data: quizz }

    $ "div", {},
      $ "h2", {}, "Mes quizzes"
      $ "ul", {}, quizzes
