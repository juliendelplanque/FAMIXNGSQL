visiting
visitPSQLASTOrderByClauseItem: aPSQLASTOrderByClauseItem
	(self childrenFor: aPSQLASTOrderByClauseItem) do: [:aChild | aChild acceptVisitor: self]