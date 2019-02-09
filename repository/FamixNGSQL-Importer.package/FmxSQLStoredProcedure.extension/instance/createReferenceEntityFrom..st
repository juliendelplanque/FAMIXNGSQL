*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	aFmxSQLEntity class = PSQLASTIgnoredLocalVariableNullObject
		ifTrue: [ ^ self ].
	^ FmxSQLStoredProcedureCall new
		candidates: { self };
		sender: aFmxSQLEntity
		yourself