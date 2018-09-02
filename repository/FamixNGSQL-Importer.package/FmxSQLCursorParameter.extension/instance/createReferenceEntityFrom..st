*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	| cursorParameterAccess |
	cursorParameterAccess := FmxSQLCursorParameterAccess new
		parameter: self;
		yourself.
	aFmxSQLEntity references add: cursorParameterAccess.
	^ cursorParameterAccess