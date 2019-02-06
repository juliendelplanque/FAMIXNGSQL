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
		
	(tWithCursorReference property: #outgoingCursorReferences)
		-* (cursorReference property: #source).
		
	(tWithAlias property: #aliases)
		<>-* (alias property: #parentBehaviouralEntity).
		
	(tWithCursor property: #cursors)
		<>-* (cursor property: #parentBehaviouralEntity).
		
	(tWithReferencesGroupReference property: #outgoingReferencesGroupReferences)
		<>-* (tReferencesGroupReference property: #source).
		
	(tReferencesGroupReference property: #referencesGroup)
		*- (referencesGroup property: #incomingReferencesGroupReference)