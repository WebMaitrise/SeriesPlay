{Link} = ReactRouter

@QuizzListItem = React.createClass
  render: ->
    $ "li", {},
      $ Link, { to: '/quizzes/'+@props.data._id }, @props.data.name
