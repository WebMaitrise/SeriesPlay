{Link} = ReactRouter

@ShowQuizz = React.createClass
  mixins: [ ReactMeteorData ]

  getMeteorData: ->
    quizz: Quizzes.findOne(@props.params.quizzid)

  componentDidMount: ->
    Meteor.subscribe 'quizzes'

  render: ->
    $ "div", {},
      $ "h2", {}, @data.quizz.name
