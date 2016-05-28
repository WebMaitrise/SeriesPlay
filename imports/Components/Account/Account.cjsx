React = require 'react'
$ = React.createElement

{Link} = require 'react-router'

MyQuizzes = require './MyQuizzes.cjsx'

Account = React.createClass
  render: ->
    $ "div", { className:'test' },
      $ MyQuizzes


module.exports = Account