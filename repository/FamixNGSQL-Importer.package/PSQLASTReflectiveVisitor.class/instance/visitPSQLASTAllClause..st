visiting
visitPSQLASTAllClause: aPSQLASTAllClause
	(self childrenFor: aPSQLASTAllClause) do: [:aChild | aChild acceptVisitor: self]