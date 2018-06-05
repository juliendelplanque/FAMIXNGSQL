model building - entities
createStoredProceduresIn: aMooseModel
	metadata getFunctions
		do: [ :pgFunction | 
			| function visitor |
			function := FmxSQLStoredProcedure new
				name: pgFunction name;
				returnType: (pgToFamixEntities at: pgFunction returnType);
				mooseModel: aMooseModel;
				yourself.
			visitor := PSQLASTReflectiveVisitor model: aMooseModel function: function.
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
			pgFunction isStub
				ifFalse: [ pgFunction ast acceptVisitor: visitor ] ]