{ Link } = ReactRouter

@App = React.createClass
  render: ->
    $ "div", {},
      $ "h2", {},
        $ Link, { to: '/' }, "Quizz App"
      $ AccountBar
      @props.children
