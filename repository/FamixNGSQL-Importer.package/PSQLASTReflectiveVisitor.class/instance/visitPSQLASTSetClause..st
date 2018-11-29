visiting
visitPSQLASTSetClause: aPSQLASTSetClause
	aPSQLASTSetClause childrenDo: [:aChild | aChild acceptVisitor: self]