model building - entities
createForeignTablesIn: mooseModel
	metadata getForeignTables do: [ :pgForeignTable |
		|table|
		table := FmxSQLForeignTable new
						name: pgForeignTable name;
						parentNamespace: (pgToFamixEntities at: pgForeignTable namespace);
						mooseModel: mooseModel;
						yourself.
		pgToFamixEntities at: pgForeignTable put: table.
						
		pgForeignTable columns do: [ :pgColumn |
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
					isCertain: true;
					mooseModel: mooseModel;
					yourself ] ].
		"Add special columns."
		FmxSQLColumn new
			name: 'tableoid';
			columnsContainer: table ] displayingProgress: 'Creating foreign tables'