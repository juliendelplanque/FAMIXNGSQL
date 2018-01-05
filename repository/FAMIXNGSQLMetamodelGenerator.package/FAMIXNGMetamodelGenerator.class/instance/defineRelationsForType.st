initialization
defineRelationsForType

	(type as: #TType property: #columns)
		-*
	(column as: #TColumn property: #dataType).
	
	"(type as: #TType property: #columns)
		-*
	(expression as: #TExpression property: #dataType)."

	(type as: #TType property: #aggregates)
		-*
	(aggregate as: #TAggregate property: #stateDataType).

	(type as: #TType property: #functions)
		-*
	(function as: #TFunction property: #returnType).
