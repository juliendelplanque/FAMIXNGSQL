visiting
visitPSQLASTDistinctClause: aPSQLASTDistinctClause
	(self childrenFor: aPSQLASTDistinctClause) do: [:aChild | aChild acceptVisitor: self]