Extension { #name : #FmxSQLIntoClause }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLIntoClause >> reachableEntities [
	"The INTO clause adds only tables and views in the scope"

	^ super reachableEntities
		,
			(self outgoingTableReferences
				flatCollect: [ :aReference | 
					aReference reference isColumnsContainer
						ifTrue: [ aReference reference reachableEntities ]
						ifFalse: [ #() ] ])
]
