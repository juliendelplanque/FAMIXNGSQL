definition - behavioural
defineBehaviouralTraits
	tWithDerivedTableReference := builder
		newTraitNamed: #TWithDerivedTableReference.
	tWithTableReference := builder newTraitNamed: #TWithTableReference.
	tWithViewReference := builder newTraitNamed: #TWithViewReference.
	tWithAlias := builder newTraitNamed: #TWithAlias.
	tWithCursor := builder newTraitNamed: #TWithCursor.
	tWithCursorReference := builder newTraitNamed: #TWithCursorReference.
	tReferencesGroupReference := builder
		newTraitNamed: #TReferencesGroupReference.
	tWithReferencesGroupReference := builder
		newTraitNamed: #TWithReferencesGroupReference