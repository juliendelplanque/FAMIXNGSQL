Extension { #name : #FmxSQLReference }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLReference >> reference [
	^ self subclassResponsibility
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLReference >> resolveAsPartOfTheQuery: aFmxSQLInsertQuery [ 
	self shouldBeImplemented.
]
