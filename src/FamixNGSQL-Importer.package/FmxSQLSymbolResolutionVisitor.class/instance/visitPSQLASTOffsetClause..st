visiting
visitPSQLASTOffsetClause: aPSQLASTOffsetClause
	aPSQLASTOffsetClause childrenDo: [:aChild | aChild acceptVisitor: self]