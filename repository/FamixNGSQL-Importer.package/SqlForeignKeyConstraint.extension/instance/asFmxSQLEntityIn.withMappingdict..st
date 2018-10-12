*FamixNGSQL-Importer
asFmxSQLEntityIn: aMooseModel withMappingdict: pgToFamixEntities
	^ FmxSQLForeignKeyConstraint new
			name: self name;
			columns: (self constrainedColumns collect: [ :pgColumn | pgToFamixEntities at: pgColumn ]);
			table: (pgToFamixEntities at: self constrainedColumns anyOne) columnsContainer;
			referencedColumns: (self referencedObjects collect: [ :pgColumn | pgToFamixEntities at: pgColumn ]);
			mooseModel: aMooseModel;
			yourself