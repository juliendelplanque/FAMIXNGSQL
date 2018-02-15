model building - entities
createConstraintsIn: aMooseModel
	(metadata objects select: [ :o | o class = SqlCheckConstraint ]) do: [ :pgCheckConstraint |
		FmxSQLCheckConstraint new
			columns: (pgCheckConstraint constrainedColumns collect: [ :pgColumn | pgToFamixEntities at: pgColumn ]);
			table: (pgToFamixEntities at: pgCheckConstraint constrainedColumns anyOne) table;
			mooseModel: aMooseModel;
			yourself ].
	
	(metadata objects select: [ :o | o class = SqlForeignKeyConstraint ]) do: [ :pgCheckConstraint |
		FmxSQLForeignKeyConstraint new
			columns: (pgCheckConstraint constrainedColumns collect: [ :pgColumn | pgToFamixEntities at: pgColumn ]);
			table: (pgToFamixEntities at: pgCheckConstraint constrainedColumns anyOne) table;
			mooseModel: aMooseModel;
			yourself ].
	
	(metadata objects select: [ :o | o class = SqlPrimaryKeyConstraint ]) do: [ :pgCheckConstraint |
		FmxSQLPrimaryKeyConstraint new
			columns: (pgCheckConstraint constrainedColumns collect: [ :pgColumn | pgToFamixEntities at: pgColumn ]);
			table: (pgToFamixEntities at: pgCheckConstraint constrainedColumns anyOne) table;
			mooseModel: aMooseModel;
			yourself ].
	
	(metadata objects select: [ :o | o class = SqlUniqueConstraint ]) do: [ :pgCheckConstraint |
		FmxSQLUniqueConstraint new
			columns: (pgCheckConstraint constrainedColumns collect: [ :pgColumn | pgToFamixEntities at: pgColumn ]);
			table: (pgToFamixEntities at: pgCheckConstraint constrainedColumns anyOne) table;
			mooseModel: aMooseModel;
			yourself ].