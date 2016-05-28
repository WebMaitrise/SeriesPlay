React = require 'react'
$ = React.createElement

{Link} = require 'react-router'

EditQuizzQuestions = require './EditQuizzQuestions.cjsx'

EditQuizz = React.createClass
  mixins: [ ReactMeteorData ]

  getMeteorData: ->
    Meteor.subscribe 'quizzes'

    quizz: Quizzes.findOne(@props.params.quizzid)

  render: ->
    console.log @data.quizz
    if Meteor.userId() == @data.quizz.owner
      editQuizz = $ EditQuizzQuestions, { quizzId: @data.quizz._id, questions: @data.quizz.questions }
    else
      editQuizz = "Permission denied"

    $ "div", {},
      $ "h2", {}, @data.quizz.name
      editQuizz


module.exports = EditQuizz