visiting
visitPSQLASTConflictAction: aPSQLASTConflictAction
	aPSQLASTConflictAction childrenDo: [:aChild | aChild acceptVisitor: self]