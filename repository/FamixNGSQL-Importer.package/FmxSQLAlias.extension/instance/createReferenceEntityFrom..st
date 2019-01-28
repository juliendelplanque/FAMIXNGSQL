*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	^ FmxSQLAliasAccess new
		alias: self;
		from: aFmxSQLEntity;
		yourself.