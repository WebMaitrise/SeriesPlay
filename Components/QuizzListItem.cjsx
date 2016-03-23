{Link} = ReactRouter

@QuizzListItem = React.createClass
  render: ->
    $ "li", {}, @props.data.name
