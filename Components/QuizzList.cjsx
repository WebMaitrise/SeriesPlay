{Link} = ReactRouter

@QuizzList = React.createClass
  mixins: [ ReactMeteorData ]

  getMeteorData: ->
    quizzes: Quizzes.find({}).fetch()

  componentDidMount: ->
    Meteor.subscribe 'quizzes'

  render: ->
    quizzes = @data.quizzes.map (quizz) ->
      $ QuizzListItem, { key: quizz._id._str, data: quizz }

    $ "div", {},
      $ "h2", {}, "Liste des quizz"

      $ "ul", {}, quizzes
