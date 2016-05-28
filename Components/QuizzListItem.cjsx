React = require 'react'
{Link} = require 'react-router'

QuizzListItem = React.createClass
  render: ->
    $ "li", {},
      $ Link, { to: '/quizzes/'+@props.data._id }, @props.data.name


module.exports = QuizzListItem