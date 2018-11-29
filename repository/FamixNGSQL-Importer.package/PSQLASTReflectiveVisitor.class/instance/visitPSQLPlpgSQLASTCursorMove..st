visiting
visitPSQLPlpgSQLASTCursorMove: aPSQLPlpgSQLASTCursorMove
	aPSQLPlpgSQLASTCursorMove childrenDo: [:aChild | aChild acceptVisitor: self]