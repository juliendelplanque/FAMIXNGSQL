initialization
defineRelationsForFunction

	(function as: #TFunction property: #triggers)
		-*
	(trigger as: #TTrigger property: #function).

	(function as: #TFunction property: #usersAsState)
		-*
	(aggregate as: #TAggregate property: #stateFunction).

	(function as: #TFunction property: #usersAsFinal)
		-*
	(aggregate as: #TAggregate property: #finalFunction).

	(function as: #TFunction property: #queries)
		<>-*
	(query as: #TQuery property: #parentFunction).


