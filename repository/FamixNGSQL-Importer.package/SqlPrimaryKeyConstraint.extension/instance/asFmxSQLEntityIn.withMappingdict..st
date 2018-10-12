*FamixNGSQL-Importer
asFmxSQLEntityIn: aMooseModel withMappingdict: pgToFamixEntities
	^ FmxSQLPrimaryKeyConstraint new
			name: self name;
			columns: (self constrainedColumns collect: [ :pgColumn | pgToFamixEntities at: pgColumn ]);
			table: (pgToFamixEntities at: self constrainedColumns anyOne) columnsContainer;
			mooseModel: aMooseModel;
			yourself