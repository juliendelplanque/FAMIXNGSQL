Extension { #name : #FmxSQLColumnsContainerAlias }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLColumnsContainerAlias >> reachableEntities [
	^ ((self outgoingTableReferences , self outgoingDerivedTableReferences , self outgoingViewReferences) flatCollect: [ :link | link to reachableEntities ]) , self columnAliases
]
