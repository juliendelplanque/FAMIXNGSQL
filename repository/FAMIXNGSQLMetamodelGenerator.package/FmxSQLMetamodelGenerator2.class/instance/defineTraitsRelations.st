definition
defineTraitsRelations
	(tWithDerivedTableReference property: #outgoingDerivedTableReferences)
		-* (derivedTableReference property: #source).
	
	(tWithColumnReference property: #outgoingColumnReferences)
		-* (columnReference property: #source).
	
	(tWithTableReference property: #outgoingTableReferences)
		-* (tableReference property: #source).
	
	(tWithViewReference property: #outgoingViewReferences)
		-* (viewReference property: #source).
		
	(tWithAlias property: #aliases)
		<>-* (alias property: #parentBehaviouralEntity)