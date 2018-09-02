visiting
visitPSQLPlpgSQLASTCursorMove: aPSQLPlpgSQLASTCursorMove
	(self childrenFor: aPSQLPlpgSQLASTCursorMove) do: [:aChild | aChild acceptVisitor: self]