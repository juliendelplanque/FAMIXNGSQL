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
				FmxSQLNotNullConstraint new
					table: table;
					columns: { (pgToFamixEntities at: pgColumn) };
					mooseModel: mooseModel;
					yourself ] ] ]