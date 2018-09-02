visiting
visitPSQLPlpgSQLASTBlockLabel: aPSQLPlpgSQLASTBlockLabel
	(self childrenFor: aPSQLPlpgSQLASTBlockLabel) do: [:aChild | aChild acceptVisitor: self]