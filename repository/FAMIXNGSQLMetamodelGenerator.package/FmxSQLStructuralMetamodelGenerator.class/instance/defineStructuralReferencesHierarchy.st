definition - structural
defineStructuralReferencesHierarchy
	reference --|> association.
	reference --|> #TArgument.
	reference --|> #TDependencyQueries.
	reference --|> #TEntityMetaLevelDependency.
	tableReference --|> reference.
	columnReference --|> reference.
	typeReference --|> reference