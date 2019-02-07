definition - structural
defineStructuralTraits
	tAbstractType := builder newTraitNamed: #AbstractType.
	tColumn := builder newTraitNamed: #TColumn.
	tColumnsContainer := builder
		newTraitNamed: #ColumnsContainer
		comment: self columnsContainerComment.
	tQueryContainer := builder
		newTraitNamed: #TQueryContainer
		comment: self queryContainerComment.
	tWithColumnReference := builder newTraitNamed: #TWithColumnReference