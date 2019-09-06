visiting
visitPSQLPlpgSQLASTSimpleCase: aPSQLPlpgSQLASTSimpleCase
	aPSQLPlpgSQLASTSimpleCase childrenDo: [:aChild | aChild acceptVisitor: self]