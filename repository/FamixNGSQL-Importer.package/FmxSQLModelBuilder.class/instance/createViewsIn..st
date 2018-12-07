model building - entities
createViewsIn: aMooseModel
	metadata getViews do: [ :pgView |
		|view visitor|
		view := FmxSQLView new
					name: pgView name;
					sourceCode: pgView definition;
					mooseModel: aMooseModel;
					yourself.
		pgToFamixEntities at: pgView put: view.
		visitor := PSQLASTReflectiveVisitor model: aMooseModel view: view errorReport: self errorReport.
		[ 
			pgView ast in: [ :ast |
				ast isPetitFailure
					ifTrue: [ self errorReport addError: ast ]
					ifFalse: [ 
						view query: (ast acceptVisitor: visitor) entity query ] ]
		] on: MessageNotUnderstood do: [ :error |
			self errorReport addError: error ].
		pgView columns do: [ :pgColumn |
			pgToFamixEntities
				at: pgColumn
				put: (FmxSQLColumn new
						name: pgColumn name;
						mooseModel: aMooseModel;
						columnsContainer: view;
						type: (pgToFamixEntities at: pgColumn datatype);
						yourself) ] ]