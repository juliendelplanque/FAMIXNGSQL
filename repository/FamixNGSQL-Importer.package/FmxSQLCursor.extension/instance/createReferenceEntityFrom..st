*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	^ FmxSQLCursorReference new
		cursor: self;
		source: aFmxSQLEntity;
		yourself