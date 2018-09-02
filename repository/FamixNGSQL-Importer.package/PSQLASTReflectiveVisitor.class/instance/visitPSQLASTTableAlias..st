visiting
visitPSQLASTTableAlias: aPSQLASTTableAlias
	(self childrenFor: aPSQLASTTableAlias) do: [:aChild | aChild acceptVisitor: self]