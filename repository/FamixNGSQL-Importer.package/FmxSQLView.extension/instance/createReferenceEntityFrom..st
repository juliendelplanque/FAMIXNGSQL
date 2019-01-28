*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	FmxSQLViewReference new
		view: self;
		source: aFmxSQLEntity