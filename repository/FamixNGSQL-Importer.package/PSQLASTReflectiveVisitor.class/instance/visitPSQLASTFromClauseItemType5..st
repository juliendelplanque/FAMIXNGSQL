visiting
visitPSQLASTFromClauseItemType5: aPSQLASTFromClauseItemType5
	(self childrenFor: aPSQLASTFromClauseItemType5) do: [:aChild | aChild acceptVisitor: self]