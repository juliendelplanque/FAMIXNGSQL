Extension { #name : #FmxSQLStoredProcedure }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLStoredProcedure >> createReferenceEntityFrom: aFmxSQLEntity [
	aFmxSQLEntity class = PSQLASTIgnoredLocalVariableNullObject
		ifTrue: [ ^ self ].
	^ FmxSQLStoredProcedureCall new
		candidates: { self };
		sender: aFmxSQLEntity;
		mooseModel: aFmxSQLEntity mooseModel;
		yourself
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLStoredProcedure >> reachableEntities [
	^ self localVariables, self parameters
]
