model building - entities
createViewsIn: aMooseModel
	metadata getViews
		do: [ :pgView | 
			| view |
			view := FmxSQLView new
				name: pgView name;
				parentNamespace: (pgToFamixEntities at: pgView namespace);
				source: pgView definition;
				mooseModel: aMooseModel;
				yourself.
			pgToFamixEntities at: pgView put: view.
			pgView columns
				do: [ :pgColumn | 
					pgToFamixEntities
						at: pgColumn
						put:
							(FmxSQLColumn new
								name: pgColumn name;
								mooseModel: aMooseModel;
								columnsContainer: view;
								type: (pgToFamixEntities at: pgColumn datatype);
								yourself) ] ]