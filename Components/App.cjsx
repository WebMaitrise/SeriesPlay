{Link} = require('react-router');

@App = React.createClass
  render: ->
    $ "div", {},
      $ "h2", {},
        $ Link, { to: '/' }, "Quizz App"
      $ AccountBar
      @props.children
