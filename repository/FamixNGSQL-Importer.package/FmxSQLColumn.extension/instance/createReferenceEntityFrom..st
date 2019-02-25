*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	^ FmxSQLColumnReference new
		column: self;
		source: aFmxSQLEntity;
		isWildCardReference: false;
		mooseModel: aFmxSQLEntity mooseModel;
		yourself