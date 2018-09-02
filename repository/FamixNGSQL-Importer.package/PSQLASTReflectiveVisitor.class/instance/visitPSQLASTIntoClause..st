visiting
visitPSQLASTIntoClause: aPSQLASTIntoClause
	(self childrenFor: aPSQLASTIntoClause) do: [:aChild | aChild acceptVisitor: self]