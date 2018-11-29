visiting
visitPSQLPlpgSQLASTAliasDeclaration: aPSQLPlpgSQLASTAliasDeclaration
	aPSQLPlpgSQLASTAliasDeclaration childrenDo: [:aChild | aChild acceptVisitor: self]