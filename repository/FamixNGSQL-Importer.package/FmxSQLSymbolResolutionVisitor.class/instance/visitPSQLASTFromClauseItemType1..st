visiting
visitPSQLASTFromClauseItemType1: aPSQLASTFromClauseItemType1
	| table |
	table := self findTableOrViewNamed: (self visit: aPSQLASTFromClauseItemType1 tableName).
	self visit: aPSQLASTFromClauseItemType1 alias thenDo: [ :alias |
		self solver defineAliasInCurrentScope: (self createFmxSQLAliasNamed: alias forCurrentEntity: table nodeForReference: aPSQLASTFromClauseItemType1 tableName) for: table ].
	self visitAll: aPSQLASTFromClauseItemType1 columnAliases thenDoForEach: [ :columnAlias | Halt now	"Alias not managed now" ].
	^ self createReferenceTo: table from: aPSQLASTFromClauseItemType1 tableName