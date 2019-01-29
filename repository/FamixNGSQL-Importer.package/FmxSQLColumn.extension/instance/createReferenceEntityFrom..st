*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	^ FmxSQLColumnReference new
		column: self;
		source: aFmxSQLEntity;
		yourself