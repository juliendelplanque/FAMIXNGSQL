visiting
visitPSQLASTWildCard: aPSQLASTWildCard
	"Here we will create a reference on each accessible entities at the current scope"

	self topScopeReachableEntities
		do: [ :aReachableEntity | (aReachableEntity createReferenceEntityFrom: self currentEntity) mooseModel: self model ]