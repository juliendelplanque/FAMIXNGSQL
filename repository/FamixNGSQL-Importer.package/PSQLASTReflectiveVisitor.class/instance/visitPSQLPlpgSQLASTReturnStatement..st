visiting
visitPSQLPlpgSQLASTReturnStatement: aPSQLPlpgSQLASTReturnStatement
	(self childrenFor: aPSQLPlpgSQLASTReturnStatement) do: [:aChild | aChild acceptVisitor: self]