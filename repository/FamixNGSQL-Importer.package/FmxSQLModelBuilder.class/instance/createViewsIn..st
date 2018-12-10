model building - entities
createViewsIn: aMooseModel
	metadata getViews do: [ :pgView |
		|view|
		view := FmxSQLView new
					name: pgView name;
					sourceCode: pgView definition;
					mooseModel: aMooseModel;
					yourself.
		pgToFamixEntities at: pgView put: view.
		pgView columns do: [ :pgColumn |
			pgToFamixEntities
				at: pgColumn
				put: (FmxSQLColumn new
						name: pgColumn name;
						mooseModel: aMooseModel;
						columnsContainer: view;
						type: (pgToFamixEntities at: pgColumn datatype);
						yourself) ] ].
	
	"Need to do it in 2 steps because views can reference each others."
	metadata getViews do: [ :pgView |
		|visitor|
		visitor := PSQLASTReflectiveVisitor model: aMooseModel view: (pgToFamixEntities at: pgView) errorReport: self errorReport.
		pgView ast in: [ :ast |
			ast isPetitFailure
				ifTrue: [ "ast inspect; halt."self errorReport addError: ast ]
				ifFalse: [ 
					(pgToFamixEntities at: pgView) query: (ast acceptVisitor: visitor) entity query ] ]. ]