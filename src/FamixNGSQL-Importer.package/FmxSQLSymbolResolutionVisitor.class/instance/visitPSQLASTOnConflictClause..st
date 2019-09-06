visiting
visitPSQLASTOnConflictClause: aPSQLASTOnConflictClause
	aPSQLASTOnConflictClause childrenDo: [:aChild | aChild acceptVisitor: self]