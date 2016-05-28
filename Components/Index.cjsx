React = require 'react'
{Link} = require 'react-router'

QuizzList = require './QuizzList.cjsx'

Index = React.createClass

  render: ->
    $ "div", {},
      $ QuizzList


module.exports = Index