definition - behavioural
defineBehaviouralTraitsRelations
	(tWithDerivedTableReference property: #outgoingDerivedTableReferences)
		-* (derivedTableReference property: #source).
	(tWithViewReference property: #outgoingViewReferences)
		-* (viewReference property: #source).
	(tWithCursorReference property: #outgoingCursorReferences)
		-* (cursorReference property: #source).
	self flag: #TODO."Needs more alias types."
	((tWithAlias property: #aliases)
		<>-* (alias property: #parentBehaviouralEntity))
		withoutPrimaryContainer.
	(tWithCursor property: #cursors)
		<>-* (cursor property: #parentBehaviouralEntity).
	(tWithReferencesGroupReference
		property: #outgoingReferencesGroupReferences)
		<>-* (tReferencesGroupReference property: #source).
	(tReferencesGroupReference property: #referencesGroup)
		*- (referencesGroup property: #incomingReferencesGroupReference)