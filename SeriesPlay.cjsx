@Quizzes = new Mongo.Collection 'quizzes'
@Questions = new Mongo.Collection 'questions'
@Responses = new Mongo.Collection 'responses'

{Route, IndexRoute} = ReactRouter
@$ = React.createElement

Meteor.startup ->
	AppRoutes = $ Route, { path:"/", component: App },
		$ IndexRoute, { component: Index }
		$ Route, { path: "/login", component: LoginForm }
		$ Route, { path: "/account", component: Account }
		$ Route, { path: "/signin", component: SignInForm }
		$ Route, { path: "/quizzes/new", component: createQuizzForm }
		$ Route, { path: "/quizzes/:quizzid", component: ShowQuizz }
		$ Route, { path: "/quizzes/:quizzid/edit", component: EditQuizz }

	ReactRouterSSR.Run AppRoutes


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

		questionId = Questions.insert
			question: question
			quizz: quizzId

		# TODO move into hook
		Quizzes.update quizzId,
			$push:
				questions: Questions.findOne questionId

	removeQuestion: (questionId) ->
		if !this.userId #TODO : Add security
			throw new Meteor.Error "not-authorized"

		Questions.remove questionId

	addResponse: (questionId, response) ->
		if !this.userId #TODO : Add security
			throw new Meteor.Error "not-authorized"

		question = Questions.findOne questionId

		responseId = Responses.insert
			response: response
			question: questionId

		#TODO Move into hook
		Questions.update questionId,
			$push:
				responses: Responses.findOne responseId

	removeResponse: (responseId) ->
		if !this.userId #TODO : Add security
			throw new Meteor.Error "not-authorized"

		Responses.remove responseId

	Questions.after.remove (userId, doc) ->
		#Remove Question in the Quizz
		Quizzes.update doc.quizz,
			$pull:
				questions:
					_id: doc._id

		#Remove All responses of this Question
		Responses.remove
			question: doc._id

	Responses.after.remove (userId, doc) ->
		#Remove Response in the Question
		Questions.update doc.question,
			$pull:
				responses:
					_id: doc._id

	#TODO Hooks
  ## On Create Response (Add this response into Question Entity)
  ## On Create Question (Add this question into Quizz Entity)

if Meteor.isServer
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
