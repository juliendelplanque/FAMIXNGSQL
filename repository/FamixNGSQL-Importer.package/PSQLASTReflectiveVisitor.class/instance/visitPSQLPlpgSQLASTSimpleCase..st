visiting
visitPSQLPlpgSQLASTSimpleCase: aPSQLPlpgSQLASTSimpleCase
	(self childrenFor: aPSQLPlpgSQLASTSimpleCase) do: [:aChild | aChild acceptVisitor: self]