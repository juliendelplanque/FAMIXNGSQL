visiting
visitPSQLPlpgSQLASTAliasDeclaration: aPSQLPlpgSQLASTAliasDeclaration
	(self childrenFor: aPSQLPlpgSQLASTAliasDeclaration) do: [:aChild | aChild acceptVisitor: self]