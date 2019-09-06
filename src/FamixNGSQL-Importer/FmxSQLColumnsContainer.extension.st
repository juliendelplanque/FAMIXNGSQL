Extension { #name : #FmxSQLColumnsContainer }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLColumnsContainer >> isColumnsContainer [
	^ true
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLColumnsContainer >> reachableEntities [
	^ self columns
]
