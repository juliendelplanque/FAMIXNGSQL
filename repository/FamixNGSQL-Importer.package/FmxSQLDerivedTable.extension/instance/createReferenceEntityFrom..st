*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	^ FmxSQLDerivedTableReference new
		derivedTable: self;
		source: aFmxSQLEntity;
		yourself.