{Link} = require('react-router');

@MyQuizzItem = React.createClass
  render: ->
    $ "li", {},
      $ Link, { to: '/quizzes/'+@props.data._id }, @props.data.name
      " | "
      $ "a", { href: "#", onClick: @_remove }, "Supr."

  _remove: (e) ->
    e.preventDefault()

    Meteor.call "removeQuizz", @props.data._id
