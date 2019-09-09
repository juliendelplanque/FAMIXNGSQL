Extension { #name : #FmxSQLQualifiedReference }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLQualifiedReference >> addReference: aFmxSQLReference [
	aFmxSQLReference qualifiedReference: self.
	^ self
]
