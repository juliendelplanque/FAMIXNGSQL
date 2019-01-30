*FamixNGSQL-Importer
reachableEntities
	"The FROM clause add only tables and views in the scope, not the columns and functions which are only used for conditions"

	^ super reachableEntities
		,
			((self outgoingTableReferences , self outgoingDerivedTableReferences , self outgoingViewReferences)
				flatCollect: [ :aReference | 
					aReference to isColumnsContainer
						ifTrue: [ aReference reference reachableEntities ]
						ifFalse: [ #() ] ])