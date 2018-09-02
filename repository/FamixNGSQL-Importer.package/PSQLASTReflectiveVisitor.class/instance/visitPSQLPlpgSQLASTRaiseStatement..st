visiting
visitPSQLPlpgSQLASTRaiseStatement: aPSQLPlpgSQLASTRaiseStatement
	(self childrenFor: aPSQLPlpgSQLASTRaiseStatement) do: [:aChild | aChild acceptVisitor: self]