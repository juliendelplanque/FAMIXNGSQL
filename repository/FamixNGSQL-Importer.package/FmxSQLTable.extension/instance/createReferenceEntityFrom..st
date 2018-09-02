*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	| tableReference |
	tableReference := FmxSQLTableReference new
		table: self;
		yourself.
	aFmxSQLEntity references add: tableReference.
	^ tableReference