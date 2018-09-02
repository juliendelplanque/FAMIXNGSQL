visiting
visitPSQLASTSetClause: aPSQLASTSetClause
	(self childrenFor: aPSQLASTSetClause) do: [:aChild | aChild acceptVisitor: self]