@Quizzes = new Mongo.Collection 'quizzes'
{Route, IndexRoute} = ReactRouter

Meteor.startup ->
  AppRoutes = <Route path="/" component={AppComponent}>
      <IndexRoute component={Index} />
      <Route path="/login" component={LoginForm} />
      <Route path="/account" component={Account} />
    </Route>

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
