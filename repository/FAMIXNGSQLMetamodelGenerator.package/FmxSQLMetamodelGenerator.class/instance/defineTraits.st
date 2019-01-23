definition
defineTraits
	tColumnsReferencer := builder newTraitNamed: #TColumnsReferencer.
	
	(tColumnsReferencer property: #referencedColumns)
		<>- (columnReference property: #columnReferencer)