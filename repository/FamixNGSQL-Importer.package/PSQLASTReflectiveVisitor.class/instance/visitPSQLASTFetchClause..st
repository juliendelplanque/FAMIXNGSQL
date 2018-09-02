visiting
visitPSQLASTFetchClause: aPSQLASTFetchClause
	(self childrenFor: aPSQLASTFetchClause) do: [:aChild | aChild acceptVisitor: self]