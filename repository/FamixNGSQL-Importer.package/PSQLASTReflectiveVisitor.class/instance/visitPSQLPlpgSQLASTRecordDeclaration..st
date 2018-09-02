visiting
visitPSQLPlpgSQLASTRecordDeclaration: aPSQLPlpgSQLASTRecordDeclaration
	(self childrenFor: aPSQLPlpgSQLASTRecordDeclaration) do: [:aChild | aChild acceptVisitor: self]