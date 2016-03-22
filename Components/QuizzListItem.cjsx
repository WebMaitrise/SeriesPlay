{Link} = ReactRouter

@QuizzListItem = React.createClass
  render: ->
    <li>{this.props.data._id._str}</li>
