React = require 'react'
{Link} = require 'react-router'

AccountBar = require './AccountBar.cjsx'

App = React.createClass
  render: ->
    $ "div", {},
      $ "h2", {},
        $ Link, { to: '/' }, "Quizz App"
      $ AccountBar
      @props.children


module.exports = App