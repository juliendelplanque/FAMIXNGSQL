visiting
visitPSQLPlpgSQLASTWhileLoop: aPSQLPlpgSQLASTWhileLoop
	(self childrenFor: aPSQLPlpgSQLASTWhileLoop) do: [:aChild | aChild acceptVisitor: self]