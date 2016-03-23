{Link} = ReactRouter

@MyQuizzItem = React.createClass
  render: ->
    $ "li", {},
      @props.data.name
      " | "
      $ "a", { href: "#", onClick: @_remove }, "Supr."

  _remove: (e) ->
    e.preventDefault()

    Meteor.call "removeQuizz", @props.data._id
