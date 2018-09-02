visiting
visitPSQLPlpgSQLASTCursorClose: aPSQLPlpgSQLASTCursorClose
	(self childrenFor: aPSQLPlpgSQLASTCursorClose) do: [:aChild | aChild acceptVisitor: self]