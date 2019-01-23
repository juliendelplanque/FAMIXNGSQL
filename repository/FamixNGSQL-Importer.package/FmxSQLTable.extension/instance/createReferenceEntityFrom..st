*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	| tableReference |
	tableReference := FmxSQLTableReference new
		table: self;
		source: aFmxSQLEntity;
		yourself.
	^ tableReference