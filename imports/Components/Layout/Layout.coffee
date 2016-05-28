React = require 'react'
$ = React.createElement

{Link} = require 'react-router'

AccountBar = require './AccountBar.cjsx'

Layout = React.createClass
  render: ->
    $ "div", {},
      $ "h2", {},
        $ Link, { to: '/' }, "Quizz App"
      $ AccountBar
      @props.children


module.exports = Layout