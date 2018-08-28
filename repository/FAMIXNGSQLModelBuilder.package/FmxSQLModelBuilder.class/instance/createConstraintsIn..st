model building - entities
createConstraintsIn: aMooseModel
	(metadata objects select: [ :o | o class = SqlCheckConstraint ]) do: [ :pgCheckConstraint |
		FmxSQLCheckConstraint new
			columns: (pgCheckConstraint constrainedColumns collect: [ :pgColumn | pgToFamixEntities at: pgColumn ]);
			table: (pgToFamixEntities at: pgCheckConstraint constrainedColumns anyOne) columnsContainer;
			sourceCode: pgCheckConstraint code;
			mooseModel: aMooseModel;
			yourself ].
	
	(metadata objects select: [ :o | o class = SqlForeignKeyConstraint ]) do: [ :pgForeignKeyConstraint |
		FmxSQLForeignKeyConstraint new
			columns: (pgForeignKeyConstraint constrainedColumns collect: [ :pgColumn | pgToFamixEntities at: pgColumn ]);
			table: (pgToFamixEntities at: pgForeignKeyConstraint constrainedColumns anyOne) columnsContainer;
			referencedColumns: (pgForeignKeyConstraint referencedObjects collect: [ :pgColumn | pgToFamixEntities at: pgColumn ]);
			mooseModel: aMooseModel;
			yourself ].
	
	(metadata objects select: [ :o | o class = SqlPrimaryKeyConstraint ]) do: [ :pgCheckConstraint |
		FmxSQLPrimaryKeyConstraint new
			columns: (pgCheckConstraint constrainedColumns collect: [ :pgColumn | pgToFamixEntities at: pgColumn ]);
			table: (pgToFamixEntities at: pgCheckConstraint constrainedColumns anyOne) columnsContainer;
			mooseModel: aMooseModel;
			yourself ].
	
	(metadata objects select: [ :o | o class = SqlUniqueConstraint ]) do: [ :pgCheckConstraint |
		FmxSQLUniqueConstraint new
			columns: (pgCheckConstraint constrainedColumns collect: [ :pgColumn | pgToFamixEntities at: pgColumn ]);
			table: (pgToFamixEntities at: pgCheckConstraint constrainedColumns anyOne) columnsContainer;
			mooseModel: aMooseModel;
			yourself ].