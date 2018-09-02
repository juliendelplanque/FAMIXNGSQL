visiting
visitPSQLASTFromClauseItemType4: aPSQLASTFromClauseItemType4
	(self childrenFor: aPSQLASTFromClauseItemType4) do: [:aChild | aChild acceptVisitor: self]