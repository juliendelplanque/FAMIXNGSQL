*FamixNGSQL-Importer
reachableEntities
	^ (self outgoingTableReferences , self outgoingDerivedTableReferences , self outgoingViewReferences) flatCollect: [ :link | link to reachableEntities ]