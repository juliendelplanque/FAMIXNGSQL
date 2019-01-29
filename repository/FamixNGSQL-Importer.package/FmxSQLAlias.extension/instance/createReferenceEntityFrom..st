*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	^ FmxSQLAliasAccess new
		variable: self;
		accessor: aFmxSQLEntity;
		isWrite: false;
		yourself.