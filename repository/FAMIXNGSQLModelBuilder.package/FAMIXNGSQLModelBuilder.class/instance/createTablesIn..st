model building - entities
createTablesIn: mooseModel
	metadata getTables do: [ :pgTable |
		|table|
		table := FmxSQLTable new
						name: pgTable name;
						mooseModel: mooseModel;
						yourself.
		pgToFamixEntities at: pgTable put: table.
						
		pgTable columns do: [ :pgColumn |
			pgToFamixEntities
				at: pgColumn
				put: (FmxSQLColumn new
						name: pgColumn name;
						mooseModel: mooseModel;
						table: table;
						type: (pgToFamixEntities at: pgColumn datatype);
						yourself) ] ]