visiting
visitPSQLPlpgSQLASTCursorDelete: aPSQLPlpgSQLASTCursorDelete
	(self childrenFor: aPSQLPlpgSQLASTCursorDelete) do: [:aChild | aChild acceptVisitor: self]