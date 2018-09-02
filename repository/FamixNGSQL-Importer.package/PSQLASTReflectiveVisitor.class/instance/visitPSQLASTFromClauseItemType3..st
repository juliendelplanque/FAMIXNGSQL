visiting
visitPSQLASTFromClauseItemType3: aPSQLASTFromClauseItemType3
	(self childrenFor: aPSQLASTFromClauseItemType3) do: [:aChild | aChild acceptVisitor: self]