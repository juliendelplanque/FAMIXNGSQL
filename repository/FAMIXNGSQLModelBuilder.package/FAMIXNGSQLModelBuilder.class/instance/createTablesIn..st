model building - entities
createTablesIn: mooseModel
	metadata getTables do: [ :pgTable |
		|table|
		table := FmxSQLTable new
						name: pgTable name;
						mooseModel: mooseModel;
						yourself.
						
		pgTable columns do: [ :pgColumn |
			FmxSQLColumn new
				name: pgColumn name;
				mooseModel: mooseModel;
				table: table
				yourself ] ]