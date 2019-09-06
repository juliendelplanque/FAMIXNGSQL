Extension { #name : #FmxSQLCursorParameter }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLCursorParameter >> createReferenceEntityFrom: aFmxSQLEntity [
	^ FmxSQLCursorParameterAccess new
		variable: self;
		accessor: aFmxSQLEntity;
		mooseModel: aFmxSQLEntity mooseModel;
		yourself.
]
