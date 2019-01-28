*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	| tableReference |
	^ FmxSQLTableReference new
		table: self;
		source: aFmxSQLEntity;
		yourself