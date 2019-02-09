visiting
visitPSQLPlpgSQLASTForLoop: aPSQLPlpgSQLASTForLoop
	aPSQLPlpgSQLASTForLoop childrenDo: [:aChild | aChild acceptVisitor: self]