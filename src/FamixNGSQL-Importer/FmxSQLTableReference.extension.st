Extension { #name : #FmxSQLTableReference }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLTableReference >> from [
	^ self source
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLTableReference >> reference [
	^ self table
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLTableReference >> to [
	^ self table
]
