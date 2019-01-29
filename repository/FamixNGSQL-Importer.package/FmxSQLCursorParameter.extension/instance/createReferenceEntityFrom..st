*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	^ FmxSQLCursorParameterAccess new
		variable: self;
		accessor: aFmxSQLEntity;
		yourself.