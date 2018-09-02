visiting
visitPSQLPlpgSQLASTArrayLoop: aPSQLPlpgSQLASTArrayLoop
	(self childrenFor: aPSQLPlpgSQLASTArrayLoop) do: [:aChild | aChild acceptVisitor: self]