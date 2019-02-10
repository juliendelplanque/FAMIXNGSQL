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
				FmxSQLNotNullConstraint new
					table: table;
					columns: { (pgToFamixEntities at: pgColumn) };
					mooseModel: mooseModel;
					yourself ] ].
		"Add special columns."
		FmxSQLColumn new
			name: 'tableoid';
			columnsContainer: table ]