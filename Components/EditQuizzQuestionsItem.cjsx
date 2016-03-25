{Link} = ReactRouter

@EditQuizzQuestionsItem = React.createClass
  render: ->
    $ "div", {},
      @props.question.question
      ' | '
      $ "a", { onClick: @_remove, href: '#' }, 'Supr'

  _remove: (e) ->
    e.preventDefault()

    Meteor.call 'removeQuestion', @props.question._id
