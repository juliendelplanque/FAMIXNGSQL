model building - entities
createStoredProceduresIn: aMooseModel
	| functions |
	functions := Dictionary new.
	metadata getFunctions
		do: [ :pgFunction | 
			| function visitor |
			function := FmxSQLStoredProcedure new
				name: pgFunction name;
				returnType: (pgToFamixEntities at: pgFunction returnType);
				mooseModel: aMooseModel;
				yourself.
			visitor := PSQLASTReflectiveVisitor model: aMooseModel function: function errorReport: self errorReport.
			pgFunction isSqlTriggerFunction
				ifFalse: [ "Trigger function do not have arguments"
					pgFunction arguments
						do: [ :anArgument | 
							FmxSQLParameter new
								name: anArgument name;
								mooseModel: aMooseModel;
								storedProcedure: function;
								type: (visitor findTypeNamed: anArgument datatype name) ] ].
			pgToFamixEntities at: pgFunction put: function.
			functions at: pgFunction put: function ].
	functions
		keysAndValuesDo: [ :pgFunction :function | 
			| visitor |
			visitor := PSQLASTReflectiveVisitor model: aMooseModel function: function errorReport: self errorReport.
			(pgFunction isStub or: [ pgFunction isSqlAggregateFunction ])
				ifFalse: [ ([ pgFunction ast ]
						on: MessageNotUnderstood
						do: [ :ex | ex signaler ])
						in: [ :ast | 
							ast isPetitFailure
								ifTrue: [ self errorReport addError: ast ]
								ifFalse: [ ast acceptVisitor: visitor ] ] ] ]