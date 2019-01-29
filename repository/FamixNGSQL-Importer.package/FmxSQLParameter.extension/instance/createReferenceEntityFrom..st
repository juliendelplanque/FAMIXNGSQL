*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	^ FmxSQLParameterAccess new
		variable: self;
		accessor: aFmxSQLEntity;
		yourself