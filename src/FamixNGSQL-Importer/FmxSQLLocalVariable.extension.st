Extension { #name : #FmxSQLLocalVariable }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLLocalVariable >> createReferenceEntityFrom: aFmxSQLEntity [
	aFmxSQLEntity class = PSQLASTIgnoredLocalVariableNullObject
		ifTrue: [ ^ self ].
	
	^ FmxSQLLocalVariableAccess new
		localVariable: self;
		accessor: aFmxSQLEntity;
		mooseModel: aFmxSQLEntity mooseModel;
		yourself
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLLocalVariable >> reachableEntities [
	^ self type ifNil: [ #() ] ifNotNil: [ :aType | aType reachableEntities ]
]
