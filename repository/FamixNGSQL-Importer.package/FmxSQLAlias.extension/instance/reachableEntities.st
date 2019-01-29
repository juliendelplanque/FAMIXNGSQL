*FamixNGSQL-Importer
reachableEntities
	^ (self outgoingTableReferences collect: [ :link | link reference ] thenReject: [ :entity | entity class = FmxSQLStoredProcedure ]) flatCollect: #reachableEntities