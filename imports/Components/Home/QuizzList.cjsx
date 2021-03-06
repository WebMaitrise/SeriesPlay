React = require 'react'
$ = React.createElement

{Link} = require 'react-router'

QuizzListItem = require './QuizzListItem.cjsx'

QuizzList = React.createClass
  mixins: [ ReactMeteorData ]

  getMeteorData: ->
    Meteor.subscribe 'quizzes'

    quizzes: Quizzes.find({}).fetch()

  render: ->
    quizzes = @data.quizzes.map (quizz) ->
      $ QuizzListItem, { key: quizz._id, data: quizz }

    $ "div", {},
      $ "h2", {}, "Liste des quizz"

      $ "ul", {}, quizzes


module.exports = QuizzList