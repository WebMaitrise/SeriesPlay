Meteor.startup ->
	#When remove a Response
	Responses.after.remove (userId, doc) ->
		#Remove Response in the Question
		Questions.update doc.question,
			$pull:
				responses:
					_id: doc._id

	#When insert a Response
	Responses.after.insert (userId, doc) ->
		#Insert Response in the Question
		Questions.update doc.question,
			$push:
				responses: Responses.findOne doc._id

	#When update a Response
	Responses.after.update (userId, doc) ->
		#Update Response into Question
		Questions.update "responses._id": doc._id,
			$set:
				"responses.$": doc
