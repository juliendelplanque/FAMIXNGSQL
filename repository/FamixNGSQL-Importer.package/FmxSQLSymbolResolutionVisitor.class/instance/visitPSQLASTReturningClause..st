visiting
visitPSQLASTReturningClause: aPSQLASTReturningClause
	aPSQLASTReturningClause childrenDo: [:aChild | aChild acceptVisitor: self]