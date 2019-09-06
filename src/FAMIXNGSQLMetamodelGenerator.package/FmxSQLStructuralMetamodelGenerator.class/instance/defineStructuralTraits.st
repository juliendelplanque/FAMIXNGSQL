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
	tQueryContainer withTesting.
	tWithColumnReference := builder newTraitNamed: #TWithColumnReference.
	tWithTableReference := builder newTraitNamed: #TWithTableReference.