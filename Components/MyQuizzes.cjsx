{Link} = ReactRouter

@MyQuizzes = React.createClass
  mixins: [ ReactMeteorData ]

  getMeteorData: ->
    Meteor.subscribe 'quizzes'

    quizzes: Quizzes.find({ owner: Meteor.userId() }).fetch()

  render: ->
    quizzes = @data.quizzes.map (quizz) ->
      $ MyQuizzItem, { key:quizz._id, data: quizz }

    $ "div", {},
      $ "h2", {}, "Mes quizzes"
      $ "ul", {}, quizzes
