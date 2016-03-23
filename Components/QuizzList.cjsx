{Link} = ReactRouter

@QuizzList = React.createClass
  mixins: [ ReactMeteorData ]

  getMeteorData: ->
    Meteor.subscribe 'quizzes'

    quizzes: Quizzes.find({}).fetch()

  render: ->
    quizzes = @data.quizzes.map (quizz) ->
      $ QuizzListItem, { key: quizz._id, data: quizz }

    $ "div", {},
      $ "h2", {}, "Liste des quizz"

      $ "ul", {}, quizzes
