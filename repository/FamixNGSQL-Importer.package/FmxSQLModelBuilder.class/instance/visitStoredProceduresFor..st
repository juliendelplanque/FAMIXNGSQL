model building - linking entities
visitStoredProceduresFor: aMooseModel
	metadata getFunctions
		do: [ :pgFunction | 
			| function visitor |
			function := pgToFamixEntities at: pgFunction.
			visitor := PSQLASTReflectiveVisitor
				model: aMooseModel
				function: function
				errorReport: self errorReport.
			[ 
				(pgFunction isStub or: [ pgFunction isSqlAggregateFunction ])
				ifFalse: [ ([ pgFunction ast ]
						on: MessageNotUnderstood
						do: [ :ex | ex signaler ])
						in: [ :ast | 
							ast isPetitFailure
								ifTrue: [ self errorReport addError: ast ]
								ifFalse: [ ast acceptVisitor: visitor ] ] ]
			] on: Error do: [ :error | self errorReport addError: error ] ]