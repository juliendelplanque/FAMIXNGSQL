visiting
visitPSQLASTOffsetClause: aPSQLASTOffsetClause
	(self childrenFor: aPSQLASTOffsetClause) do: [:aChild | aChild acceptVisitor: self]