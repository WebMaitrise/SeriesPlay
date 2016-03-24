{Link} = ReactRouter

@EditQuizzQuestions = React.createClass
  render: ->

    if !@props.questions or !@props.questions.length
      questions = "Pas de questions pour le moment"
    else
      questions = @props.questions.map (question) ->
        $ "div", {}, question.question #TODO : Question Component

    $ "div", {},
      $ EditQuizzAddQuestion, { quizzId: @props.quizzId }
      questions
