visiting
visitPSQLASTForClause: aPSQLASTForClause
	(self childrenFor: aPSQLASTForClause) do: [:aChild | aChild acceptVisitor: self]