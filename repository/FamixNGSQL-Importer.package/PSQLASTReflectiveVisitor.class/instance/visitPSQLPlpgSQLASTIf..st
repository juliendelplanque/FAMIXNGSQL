visiting
visitPSQLPlpgSQLASTIf: aPSQLPlpgSQLASTIf
	(self childrenFor: aPSQLPlpgSQLASTIf) do: [:aChild | aChild acceptVisitor: self]