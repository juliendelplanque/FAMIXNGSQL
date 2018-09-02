visiting
visitPSQLPlpgSQLASTCursorStatement: aPSQLPlpgSQLASTCursorStatement
	(self childrenFor: aPSQLPlpgSQLASTCursorStatement) do: [:aChild | aChild acceptVisitor: self]