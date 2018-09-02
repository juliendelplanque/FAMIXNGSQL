*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	| viewReference |
	viewReference := FmxSQLViewReference new
		view: self;
		yourself.
	aFmxSQLEntity references add: viewReference.
	^ viewReference