Extension { #name : #FmxSQLCursor }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLCursor >> createReferenceEntityFrom: aFmxSQLEntity [
	^ FmxSQLCursorReference new
		cursor: self;
		source: aFmxSQLEntity;
		mooseModel: aFmxSQLEntity mooseModel;
		yourself
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLCursor >> query [
	self assert: self queries size = 1.
	^ self queries first
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLCursor >> reachableEntities [
	^ self parameters
]
