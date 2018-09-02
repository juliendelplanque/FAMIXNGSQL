*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	| localVariableAccess |
	localVariableAccess := FmxSQLLocalVariableAccess new
		localVariable: self;
		yourself.
	aFmxSQLEntity references add: localVariableAccess.
	^ localVariableAccess