definition - behavioural
defineBehaviouralTraitsRelations
	(tWithDerivedTableReference property: #outgoingDerivedTableReferences)
		-* (derivedTableReference property: #source) source.
	(tWithViewReference property: #outgoingViewReferences)
		-* (viewReference property: #source) source.
	(tWithCursorReference property: #outgoingCursorReferences)
		-* (cursorReference property: #source) source.
	((tWithAlias property: #aliases)
		<>-* (alias property: #parentBehaviouralEntity))
		withoutPrimaryContainer.
	(tWithCursor property: #cursors)
		<>-* (cursor property: #parentBehaviouralEntity).
	(tWithReferencesGroupReference
		property: #outgoingReferencesGroupReferences)
		<>-* (tReferencesGroupReference property: #source).
	(tReferencesGroupReference property: #referencesGroup)
		*- (referencesGroup property: #incomingReferencesGroupReference).
	(entitySourceAnchor property: #entity)
		*- (tWithEntitySourceAnchor property: #anchorsOnIntervalsOfCode)