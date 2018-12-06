visiting
visitPSQLPlpgSQLASTCasesToStatements: aPSQLPlpgSQLASTCasesToStatements
	aPSQLPlpgSQLASTCasesToStatements childrenDo: [:aChild | aChild acceptVisitor: self]