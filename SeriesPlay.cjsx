@Quizzes = new Mongo.Collection 'quizzes'
@Questions = new Mongo.Collection 'questions'

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

		Quizzes.update quizzId,
			$push:
				questions: Questions.findOne questionId

	removeQuestion: (questionId) ->
		if !this.userId #TODO : Add security
			throw new Meteor.Error "not-authorized"

		question = Questions.findOne questionId

		Questions.remove questionId

		Quizzes.update question.quizz,
			$pull:
				questions:
					_id: questionId

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
