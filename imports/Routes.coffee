React = require 'react'
$ = React.createElement

Layout = require './Components/Layout/Layout.coffee'
Home = require './Components/Home/Home.cjsx'
LoginForm = require './Components/Login/LoginForm.cjsx'
Account = require './Components/Account/Account.cjsx'
SignInForm = require './Components/Signin/SignInForm.cjsx'
createQuizzForm = require './Components/Quizzes/createQuizzForm.cjsx'
ShowQuizz = require './Components/Quizzes/ShowQuizz.cjsx'
EditQuizz = require './Components/Quizzes/EditQuizz.cjsx'

{Route, IndexRoute} = require('react-router');

Routes = $ Route, { path:"/", component: Layout },
	$ IndexRoute, { component: Home }
	$ Route, { path: "/login", component: LoginForm }
	$ Route, { path: "/account", component: Account }
	$ Route, { path: "/signin", component: SignInForm }
	$ Route, { path: "/quizzes/new", component: createQuizzForm }
	$ Route, { path: "/quizzes/:quizzid", component: ShowQuizz }
	$ Route, { path: "/quizzes/:quizzid/edit", component: EditQuizz }


module.exports = Routes