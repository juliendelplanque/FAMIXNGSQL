visiting
visitPSQLASTIntoClause: aPSQLASTIntoClause
	aPSQLASTIntoClause childrenDo: [:aChild | aChild acceptVisitor: self]