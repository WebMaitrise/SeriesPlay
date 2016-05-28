Routes = require './imports/Routes.coffee'

Meteor.startup ->
	ReactRouterSSR.Run Routes


if Meteor.isServer
	Meteor.publish 'quizzes', ->
		Quizzes.find
			$or: [
				private:
					$ne: true 
			,
				owner: this.userId
			]

	Meteor.publish 'users', ->
		Accounts.users.find( _id: @userId )


	ServiceConfiguration.configurations.remove
		service: 'facebook'

	ServiceConfiguration.configurations.insert
		service: 'facebook'
		appId: process.env.FACEBOOK_APPID
		secret: process.env.FACEBOOK_SECRET

	ServiceConfiguration.configurations.remove
		service : 'twitter'

	ServiceConfiguration.configurations.insert
		service     : 'twitter',
		consumerKey : process.env.TWITTER_KEY
		secret      : process.env.TWITTER_SECRET

Meteor.methods
	#TODO : Remove questions and responses associed
	removeQuizz: (id) ->
		Quizzes.remove id

	createQuizz: (name) ->
		if !this.userId #TODO : Add security
			throw new Meteor.Error "not-authorized"

		Quizzes.insert
			name: name
			owner: this.userId
		, (err, quizzId) ->
			ReactRouter.browserHistory.push '/quizzes/'+quizzId

	addQuestion: (quizzId, question) ->
		if !this.userId #TODO : Add security
			throw new Meteor.Error "not-authorized"

		Questions.insert
			question: question
			quizz: quizzId

	removeQuestion: (questionId) ->
		if !this.userId #TODO : Add security
			throw new Meteor.Error "not-authorized"

		Questions.remove questionId

	addResponse: (questionId, response) ->
		if !this.userId #TODO : Add security
			throw new Meteor.Error "not-authorized"

		Responses.insert
			response: response
			question: questionId

	removeResponse: (responseId) ->
		if !this.userId #TODO : Add security
			throw new Meteor.Error "not-authorized"

		Responses.remove responseId
