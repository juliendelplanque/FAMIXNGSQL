visiting
visitPSQLASTForClause: aPSQLASTForClause
	aPSQLASTForClause childrenDo: [:aChild | aChild acceptVisitor: self]