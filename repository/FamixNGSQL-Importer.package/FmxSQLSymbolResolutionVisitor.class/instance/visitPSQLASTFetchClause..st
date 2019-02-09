visiting
visitPSQLASTFetchClause: aPSQLASTFetchClause
	aPSQLASTFetchClause childrenDo: [:aChild | aChild acceptVisitor: self]