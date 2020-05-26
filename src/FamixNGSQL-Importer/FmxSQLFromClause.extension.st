Extension { #name : #FmxSQLFromClause }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLFromClause >> reachableEntities [
	"WARNING: the next comment is not true anymore but I need to discuss with Guillaume before removing it.
	The FROM clause add only tables and views in the scope, not the columns and functions which are only used for conditions"

	| references tables columns |
	references :=  self outgoingTableReferences , self outgoingDerivedTableReferences , self outgoingViewReferences.
	tables := references collect: #to.
	columns := (tables select: #isColumnsContainer)
						flatCollect: #reachableEntities.
	^ super reachableEntities , tables , columns
]
