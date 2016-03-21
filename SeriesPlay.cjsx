@Quizzes = new Mongo.Collection 'quizzes'
{Route, IndexRoute} = ReactRouter

Meteor.startup ->
  AppRoutes = <Route path="/" component={AppComponent}>
      <IndexRoute component={LoginForm} />
      <Route path="/second" component={SecondComponent} />
      <Route path="/account" component={Account} />
    </Route>

  ReactRouterSSR.Run AppRoutes
