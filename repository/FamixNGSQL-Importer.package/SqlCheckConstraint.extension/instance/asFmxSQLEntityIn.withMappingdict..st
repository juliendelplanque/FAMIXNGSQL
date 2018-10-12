*FamixNGSQL-Importer
asFmxSQLEntityIn: aMooseModel withMappingdict: pgToFamixEntities
	^ FmxSQLCheckConstraint new
			name: self name;
			columns: (self constrainedColumns collect: [ :pgColumn | pgToFamixEntities at: pgColumn ]);
			table: (pgToFamixEntities at: self constrainedColumns anyOne) columnsContainer;
			sourceCode: self code;
			mooseModel: aMooseModel;
			yourself