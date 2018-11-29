visiting
visitPSQLPlpgSQLASTArrayLoop: aPSQLPlpgSQLASTArrayLoop
	aPSQLPlpgSQLASTArrayLoop childrenDo: [:aChild | aChild acceptVisitor: self]