React = require 'react'
{Link} = require 'react-router'

EditQuizzAddQuestion = React.createClass
  render: ->

    $ "form", { onSubmit: @_submit },
      $ "input", { type: 'text', name: 'question' }
      $ "input", { type: 'submit' }

  _submit: (e) ->
    e.preventDefault()

    Meteor.call "addQuestion", @props.quizzId, e.target.question.value


module.exports = EditQuizzAddQuestion