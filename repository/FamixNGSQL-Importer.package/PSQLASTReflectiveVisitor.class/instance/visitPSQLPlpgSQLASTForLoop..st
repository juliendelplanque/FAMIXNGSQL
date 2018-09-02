visiting
visitPSQLPlpgSQLASTForLoop: aPSQLPlpgSQLASTForLoop
	(self childrenFor: aPSQLPlpgSQLASTForLoop) do: [:aChild | aChild acceptVisitor: self]