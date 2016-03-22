{Link} = ReactRouter

@MyQuizzItem = React.createClass
  render: ->
    <li>
      {this.props.data._id._str}
      <a href="#" onClick={this._remove}>Supr.</a>
    </li>

  _remove: (e) ->
    e.preventDefault()

    Meteor.call "removeQuizz", @props.data._id
