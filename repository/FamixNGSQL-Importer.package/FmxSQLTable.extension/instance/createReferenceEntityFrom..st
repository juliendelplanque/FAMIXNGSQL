*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	^ FmxSQLTableReference new
		table: self;
		source: aFmxSQLEntity;
		yourself