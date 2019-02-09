model building - entities
createStoredProceduresIn: aMooseModel
	metadata getFunctions
		reject: [ :pgFunction | "Triggers are treated separately." pgFunction isSqlTriggerFunction ]
		thenDo: [ :pgFunction | 
			| function visitor |
			function := FmxSQLStoredProcedure new
				name: pgFunction name;
				parentNamespace: (pgToFamixEntities at: pgFunction namespace);
				returnType: (pgToFamixEntities at: pgFunction returnType);
				mooseModel: aMooseModel;
				isStub: (pgFunction isStub or: [ (#('plpgsql' 'sql') includes: pgFunction language name) not ]);
				yourself.
			visitor := FmxSQLSymbolResolutionVisitor
				model: aMooseModel
				function: function
				errorReport: self errorReport.
			pgFunction isSqlTriggerFunction
				ifFalse: [ "Trigger function do not have arguments"
					pgFunction arguments
						do: [ :anArgument | 
							FmxSQLParameter new
								name: anArgument name;
								mooseModel: aMooseModel;
								parentBehaviouralEntity: function;
								type: (visitor findTypeNamed: anArgument datatype name) ] ].
			pgToFamixEntities at: pgFunction put: function ]