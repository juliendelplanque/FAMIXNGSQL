visiting
visitPSQLASTFromClauseItemType6: aPSQLASTFromClauseItemType6
	self visit: aPSQLASTFromClauseItemType6 leftFromItem.
	self visit: aPSQLASTFromClauseItemType6 rightFromItem.
	self visit: aPSQLASTFromClauseItemType6 joinCondition.
	self visit: aPSQLASTFromClauseItemType6 usingList.