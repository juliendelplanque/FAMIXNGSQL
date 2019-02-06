*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	^ FmxSQLReferencesGroupReference new
		referencesGroup: self;
		source: aFmxSQLEntity;
		yourself.