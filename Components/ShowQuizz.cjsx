{Link} = require('react-router');

@ShowQuizz = React.createClass
  mixins: [ ReactMeteorData ]

  getMeteorData: ->
    Meteor.subscribe 'quizzes'

    quizz: Quizzes.findOne(@props.params.quizzid)

  render: ->

    if Meteor.userId() == @data.quizz.owner
      editQuizz = $ Link, { to: '/quizzes/'+@data.quizz._id+'/edit' }, "Modifier le Quizz"


    $ "div", {},
      $ "h2", {}, @data.quizz.name
      editQuizz
