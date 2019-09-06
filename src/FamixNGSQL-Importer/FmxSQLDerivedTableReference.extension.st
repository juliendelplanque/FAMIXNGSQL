Extension { #name : #FmxSQLDerivedTableReference }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLDerivedTableReference >> from [
	^ self source
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLDerivedTableReference >> reference [
	^ self derivedTable
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLDerivedTableReference >> to [
	^ self derivedTable
]
