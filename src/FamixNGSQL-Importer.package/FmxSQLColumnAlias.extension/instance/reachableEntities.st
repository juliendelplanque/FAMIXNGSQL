*FamixNGSQL-Importer
reachableEntities
	^ (self outgoingColumnReferences , self outgoingReferencesGroupReferences)
			flatCollect: [ :link | link to reachableEntities ]