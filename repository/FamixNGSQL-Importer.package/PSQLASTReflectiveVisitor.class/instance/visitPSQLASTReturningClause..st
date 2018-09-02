visiting
visitPSQLASTReturningClause: aPSQLASTReturningClause
	(self childrenFor: aPSQLASTReturningClause) do: [:aChild | aChild acceptVisitor: self]