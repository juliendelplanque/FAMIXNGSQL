visiting
visitPSQLPlpgSQLASTCursorStatement: aPSQLPlpgSQLASTCursorStatement
	aPSQLPlpgSQLASTCursorStatement childrenDo: [:aChild | aChild acceptVisitor: self]