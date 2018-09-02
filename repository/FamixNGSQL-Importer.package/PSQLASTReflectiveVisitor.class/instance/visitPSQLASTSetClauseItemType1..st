visiting
visitPSQLASTSetClauseItemType1: aPSQLASTSetClauseItemType1
	(self childrenFor: aPSQLASTSetClauseItemType1) do: [:aChild | aChild acceptVisitor: self]