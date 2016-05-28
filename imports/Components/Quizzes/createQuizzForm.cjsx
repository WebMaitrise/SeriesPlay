React = require 'react'
$ = React.createElement

{Link} = require 'react-router'

createQuizzForm = React.createClass

  render: ->
    $ "div", {},
      $ "form", { onSubmit: @_submit },
        $ "input", { type: 'text', name: 'name' }
        $ "input", { type: 'submit' }

  _submit: (e) ->
    e.preventDefault()

    Meteor.call "createQuizz", e.target.name.value


module.exports = createQuizzForm