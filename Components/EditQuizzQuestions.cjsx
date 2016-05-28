{Link} = require('react-router');

@EditQuizzQuestions = React.createClass
  render: ->

    if !@props.questions or !@props.questions.length
      questions = "Pas de questions pour le moment"
    else
      questions = @props.questions.map (question) ->
        $ "div", {},
          $ EditQuizzQuestionsItem, { key: question._id, question: question }

    $ "div", {},
      $ EditQuizzAddQuestion, { quizzId: @props.quizzId }
      questions
