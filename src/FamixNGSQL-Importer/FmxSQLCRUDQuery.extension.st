Extension { #name : #FmxSQLCRUDQuery }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLCRUDQuery >> reachableEntities [
	"a query do not add reachable entities (but one of its clauses can)"
	^ #()
]
