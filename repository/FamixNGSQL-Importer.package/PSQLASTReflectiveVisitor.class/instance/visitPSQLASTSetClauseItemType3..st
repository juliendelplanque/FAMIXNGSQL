visiting
visitPSQLASTSetClauseItemType3: aPSQLASTSetClauseItemType3
	(self childrenFor: aPSQLASTSetClauseItemType3) do: [:aChild | aChild acceptVisitor: self]