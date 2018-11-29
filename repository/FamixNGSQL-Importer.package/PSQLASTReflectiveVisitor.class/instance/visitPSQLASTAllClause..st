visiting
visitPSQLASTAllClause: aPSQLASTAllClause
	aPSQLASTAllClause childrenDo: [:aChild | aChild acceptVisitor: self]