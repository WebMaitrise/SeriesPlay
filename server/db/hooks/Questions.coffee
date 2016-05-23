Meteor.startup ->
	#When remove a question
	Questions.after.remove (userId, doc) ->
		#Remove Question in the Quizz
		Quizzes.update doc.quizz,
			$pull:
				questions:
					_id: doc._id

		#Remove All responses of this Question
		Responses.remove
			question: doc._id

	#When insert a Question
	Questions.after.insert (userId, doc) ->
		Quizzes.update doc.quizz,
			$push:
				questions: Questions.findOne doc._id

	#When update a Question
	Questions.after.update (userId, doc) ->
		#Update Question into Quizz
		Quizzes.update "questions._id": doc._id,
			$set:
				"questions.$": doc
