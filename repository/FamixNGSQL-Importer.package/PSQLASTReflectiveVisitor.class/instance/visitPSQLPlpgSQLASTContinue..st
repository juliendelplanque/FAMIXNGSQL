visiting
visitPSQLPlpgSQLASTContinue: aPSQLPlpgSQLASTContinue
	(self childrenFor: aPSQLPlpgSQLASTContinue) do: [:aChild | aChild acceptVisitor: self]