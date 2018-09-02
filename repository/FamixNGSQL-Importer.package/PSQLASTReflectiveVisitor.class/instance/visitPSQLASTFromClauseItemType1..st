visiting
visitPSQLASTFromClauseItemType1: aPSQLASTFromClauseItemType1
	| table |
	table := self findTableOrViewNamed: (self visit: aPSQLASTFromClauseItemType1 tableName).
	self visit: aPSQLASTFromClauseItemType1 alias thenDo: [ :alias | self createAliasInCurrentScope: alias for: table ].
	self visitAll: aPSQLASTFromClauseItemType1 columnAliases thenDoForEach: [ :columnAlias | Halt now	"Alias not managed now" ].
	^ (self createEntity: FmxSQLTableReference from: aPSQLASTFromClauseItemType1)
		table: table;
		container: self currentEntity;
		yourself