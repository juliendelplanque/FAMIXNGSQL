model building - entities
createTablesIn: mooseModel
	metadata getTables do: [ :pgTable |
		|table|
		table := FmxSQLTable new
						name: pgTable name;
						parentNamespace: (pgToFamixEntities at: pgTable namespace);
						mooseModel: mooseModel;
						yourself.
		pgToFamixEntities at: pgTable put: table.
						
		pgTable columns do: [ :pgColumn |
			pgToFamixEntities
				at: pgColumn
				put: (FmxSQLColumn new
						name: pgColumn name;
						mooseModel: mooseModel;
						columnsContainer: table;
						type: (pgToFamixEntities at: pgColumn datatype);
						yourself).
			pgColumn isNotNull ifTrue: [ 
				|constraint|
				constraint := FmxSQLNotNullConstraint new
					table: table;
					mooseModel: mooseModel;
					yourself.
				FmxSQLColumnReference new
					source: constraint;
					column: (pgToFamixEntities at: pgColumn);
					isWildCardReference: false;
					mooseModel: mooseModel;
					yourself ] ].
		"Add special columns."
		FmxSQLColumn new
			name: 'tableoid';
			columnsContainer: table ] displayingProgress: 'Creating tables'