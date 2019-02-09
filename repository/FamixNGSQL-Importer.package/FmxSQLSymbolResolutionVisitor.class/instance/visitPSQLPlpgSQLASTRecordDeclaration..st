visiting
visitPSQLPlpgSQLASTRecordDeclaration: aPSQLPlpgSQLASTRecordDeclaration
	aPSQLPlpgSQLASTRecordDeclaration childrenDo: [:aChild | aChild acceptVisitor: self]