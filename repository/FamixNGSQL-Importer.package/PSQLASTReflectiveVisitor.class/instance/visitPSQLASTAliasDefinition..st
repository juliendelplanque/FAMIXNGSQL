visiting
visitPSQLASTAliasDefinition: aPSQLASTAliasDefinition
	self
		createAliasInCurrentScope: (self visit: aPSQLASTAliasDefinition alias)
		for: [ self visit: aPSQLASTAliasDefinition definition ].
	^ self solver topScope