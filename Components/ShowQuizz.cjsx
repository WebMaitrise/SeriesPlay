{Link} = ReactRouter

@ShowQuizz = React.createClass
  mixins: [ ReactMeteorData ]

  getMeteorData: ->
    Meteor.subscribe 'quizzes'

    quizz: Quizzes.findOne(@props.params.quizzid)

  render: ->
    $ "div", {},
      $ "h2", {}, @data.quizz.name
