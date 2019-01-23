*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	| columnReference |
	columnReference := FmxSQLColumnReference new
		column: self;
		source: aFmxSQLEntity;
		yourself.
	
	^ columnReference