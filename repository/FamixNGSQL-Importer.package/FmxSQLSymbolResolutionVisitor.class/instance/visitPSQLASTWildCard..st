visiting
visitPSQLASTWildCard: aPSQLASTWildCard
	"Here we will create a reference on each accessible entities at the current scope"

	(self solver peekScopeAtIndex: 2) reachableEntities
		do: [ :aReachableEntity | (aReachableEntity createReferenceEntityFrom: self currentEntity) mooseModel: self model ]