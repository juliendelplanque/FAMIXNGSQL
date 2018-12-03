*FamixNGSQL-Importer
reachableEntities
	^ (self references collect: [ :link | link reference ] thenReject: [ :entity | entity class = FmxSQLStoredProcedure ]) flatCollect: #reachableEntities