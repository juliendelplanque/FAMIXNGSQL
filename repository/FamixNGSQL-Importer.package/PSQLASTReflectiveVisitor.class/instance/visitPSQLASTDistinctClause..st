visiting
visitPSQLASTDistinctClause: aPSQLASTDistinctClause
	aPSQLASTDistinctClause childrenDo: [:aChild | aChild acceptVisitor: self]