definition
defineTraitsRelations
	(tWithDerivedTableReference property: #outgoingDerivedTableReferences)
		-* (derivedTableReference property: #source).
	
	(tWithStoredProcedureCall property: #outgoingStoredProcedureCalls)
		-* (storedProcedureCall property: #source).
	
	(tWithColumnReference property: #outgoingColumnReferences)
		-* (columnReference property: #source).
	
	(tWithTableReference property: #outgoingTableReferences)
		-* (tableReference property: #source).
	
	(tWithViewReference property: #outgoingViewReferences)
		-* (viewReference property: #source)