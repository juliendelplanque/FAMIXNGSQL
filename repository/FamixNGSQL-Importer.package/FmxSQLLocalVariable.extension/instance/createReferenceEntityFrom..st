*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	^ FmxSQLLocalVariableAccess new
		localVariable: self;
		accessor: aFmxSQLEntity;
		yourself