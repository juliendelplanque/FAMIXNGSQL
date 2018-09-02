visiting
visitPSQLPlpgSQLASTSearchedCase: aPSQLPlpgSQLASTSearchedCase
	(self childrenFor: aPSQLPlpgSQLASTSearchedCase) do: [:aChild | aChild acceptVisitor: self]