visiting
visitPSQLPlpgSQLASTCursorMoveDirection: aPSQLPlpgSQLASTCursorMoveDirection
	(self childrenFor: aPSQLPlpgSQLASTCursorMoveDirection) do: [:aChild | aChild acceptVisitor: self]