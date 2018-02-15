model building - entities
createViewsIn: aMooseModel
	self flag: #TODO. "Parse the query."
	metadata getViews do: [ :pgView |
		|view|
		view := FmxSQLView new
					name: pgView name;
					"query: TODO;"
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
						yourself) ] ]