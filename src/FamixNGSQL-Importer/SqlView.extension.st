Extension { #name : #SqlView }

{ #category : #'*FamixNGSQL-Importer' }
SqlView >> ast [
	^ PostgreSQLParser parseSelectQuery: self code
]
