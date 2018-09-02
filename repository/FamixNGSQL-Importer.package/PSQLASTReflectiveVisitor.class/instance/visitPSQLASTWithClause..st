visiting
visitPSQLASTWithClause: aPSQLASTWithClause
	(self childrenFor: aPSQLASTWithClause) do: [:aChild | aChild acceptVisitor: self]