visiting
visitPSQLPlpgSQLASTCursorClose: aPSQLPlpgSQLASTCursorClose
	aPSQLPlpgSQLASTCursorClose childrenDo: [:aChild | aChild acceptVisitor: self]