*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	^ FmxSQLColumnReference new
		column: self;
		source: aFmxSQLEntity;
		isWildCardReference: false;
		isCertain: true;
		mooseModel: aFmxSQLEntity mooseModel;
		yourself