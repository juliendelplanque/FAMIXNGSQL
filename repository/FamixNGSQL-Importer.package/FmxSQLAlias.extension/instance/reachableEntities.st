*FamixNGSQL-Importer
reachableEntities
	^ ((self outgoingTableReferences , self accesses , self outgoingColumnReferences , self outgoingDerivedTableReferences , self outgoingViewReferences)
			flatCollect: [ :link | link to reachableEntities ])