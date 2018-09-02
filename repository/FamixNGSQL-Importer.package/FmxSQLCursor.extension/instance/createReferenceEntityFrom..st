*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	| cursorReference |
	cursorReference := FmxSQLCursorReference new
		cursor: self;
		yourself.
	aFmxSQLEntity references add: cursorReference.
	^ cursorReference