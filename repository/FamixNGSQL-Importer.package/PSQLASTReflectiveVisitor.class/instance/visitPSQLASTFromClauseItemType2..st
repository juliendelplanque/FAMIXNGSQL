visiting
visitPSQLASTFromClauseItemType2: aPSQLASTFromClauseItemType2
	self
		createAliasInCurrentScope: (self visit: aPSQLASTFromClauseItemType2 alias)
		for: (self visit: aPSQLASTFromClauseItemType2 valuesOrSelect).
	self visitAll: aPSQLASTFromClauseItemType2 columnAliases thenDoForEach: [ :each | Halt now ].