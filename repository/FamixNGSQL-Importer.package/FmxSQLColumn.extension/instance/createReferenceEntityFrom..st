*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	^ FmxSQLColumnReference new
		column: self;
		source: aFmxSQLEntity;
		mooseModel: aFmxSQLEntity mooseModel;
		yourself