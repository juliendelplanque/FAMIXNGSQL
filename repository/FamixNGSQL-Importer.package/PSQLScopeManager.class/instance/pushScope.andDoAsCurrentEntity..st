scope creation
pushScope: aPSQLScope andDoAsCurrentEntity: aBlock
	self associatedSolver pushScope: aPSQLScope.
	aBlock value.
	self addedScopes add: aPSQLScope.
	aPSQLScope isCurrentEntity: false. "It can never be the current entity because the scope manager is designed to add this scope to upper current entity."
	^ aPSQLScope