visiting
visitPSQLASTIntersectClause: aPSQLASTIntersectClause
	Halt now.
	aPSQLASTIntersectClause childrenDo: [:aChild | aChild acceptVisitor: self]