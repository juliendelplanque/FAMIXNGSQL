scope creation
pushScope: aPSQLScope
	self associatedSolver pushScope: aPSQLScope.
	self addedScopes add: aPSQLScope.
	^ aPSQLScope