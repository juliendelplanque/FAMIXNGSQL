*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	| columnReference |
	columnReference := FmxSQLColumnReference new
		column: self;
		yourself.
	aFmxSQLEntity references add: columnReference.
	^ columnReference