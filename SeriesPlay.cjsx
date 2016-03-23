@Quizzes = new Mongo.Collection 'quizzes'
{Route, IndexRoute} = ReactRouter
@$ = React.createElement

Meteor.startup ->
  AppRoutes = $ Route, { path:"/", component: App },
    $ IndexRoute, { component: Index }
    $ Route, { path: "/login", component: LoginForm }
    $ Route, { path: "/account", component: Account }
    $ Route, { path: "/signin", component: SignInForm }

  ReactRouterSSR.Run AppRoutes


if Meteor.isServer
  Meteor.publish 'quizzes', ->
    Quizzes.find
      $or: [
        {
          private:
            $ne: true
        }
        {
          owner: this.userId
        }
      ]

Meteor.methods
  removeQuizz: (id) ->
    Quizzes.remove id

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
