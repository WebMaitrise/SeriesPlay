React = require 'react'
$ = React.createElement

{Link} = require 'react-router'

QuizzList = require './QuizzList.cjsx'

Home = React.createClass

  render: ->
    $ "div", {},
      $ QuizzList


module.exports = Home