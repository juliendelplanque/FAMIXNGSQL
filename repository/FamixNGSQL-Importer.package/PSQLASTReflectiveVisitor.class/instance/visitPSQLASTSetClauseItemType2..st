visiting
visitPSQLASTSetClauseItemType2: aPSQLASTSetClauseItemType2
	(self childrenFor: aPSQLASTSetClauseItemType2) do: [:aChild | aChild acceptVisitor: self]