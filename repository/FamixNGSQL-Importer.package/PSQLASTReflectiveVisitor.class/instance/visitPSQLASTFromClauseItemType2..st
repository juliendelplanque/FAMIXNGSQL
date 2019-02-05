visiting
visitPSQLASTFromClauseItemType2: aPSQLASTFromClauseItemType2
	self
		createFmxSQLAliasNamed: (self visit: aPSQLASTFromClauseItemType2 alias)
		forCurrentEntity: (self visit: aPSQLASTFromClauseItemType2 valuesOrSelect).
	self visitAll: aPSQLASTFromClauseItemType2 columnAliases thenDoForEach: [ :each | Halt now ].