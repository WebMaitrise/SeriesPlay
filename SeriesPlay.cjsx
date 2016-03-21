@Quizzes = new Mongo.Collection 'quizzes'
{Route, IndexRoute} = ReactRouter

Meteor.startup ->
  AppRoutes = <Route path="/" component={AppComponent}>
      <IndexRoute component={FirstComponent} />
      <Route path="/second" component={SecondComponent} />
    </Route>

  ReactRouterSSR.Run AppRoutes
