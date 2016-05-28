React = require 'react'
{Link} = require 'react-router'

EditQuizzQuestionsItem = React.createClass
  render: ->
    $ "div", {},
      @props.question.question
      ' | '
      $ "a", { onClick: @_remove, href: '#' }, 'Supr'

  _remove: (e) ->
    e.preventDefault()

    Meteor.call 'removeQuestion', @props.question._id


module.exports = EditQuizzQuestionsItem