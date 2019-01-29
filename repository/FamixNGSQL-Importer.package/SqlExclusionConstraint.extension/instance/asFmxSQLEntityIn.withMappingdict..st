*FamixNGSQL-Importer
asFmxSQLEntityIn: aMooseModel withMappingdict: pgToFamixEntities
	^ FmxSQLExclusionConstraint new
			name: self name;
			columns: (self constrainedColumns collect: [ :pgColumn | pgToFamixEntities at: pgColumn ]);
			table: (pgToFamixEntities at: self constrainedColumns anyOne) columnsContainer;
			source: self code;
			mooseModel: aMooseModel;
			yourself