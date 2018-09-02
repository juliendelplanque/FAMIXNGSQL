visiting
visitPSQLPlpgSQLASTPositionalParameter: aPSQLPlpgSQLASTPositionalParameter
	(self childrenFor: aPSQLPlpgSQLASTPositionalParameter) do: [:aChild | aChild acceptVisitor: self]