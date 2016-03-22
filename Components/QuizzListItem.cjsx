{Link} = ReactRouter

@QuizzListItem = React.createClass
  render: ->
    $ "li", {}, @props.data._id._str
