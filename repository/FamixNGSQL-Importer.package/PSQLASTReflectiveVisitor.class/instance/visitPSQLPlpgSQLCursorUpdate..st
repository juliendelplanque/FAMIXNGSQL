visiting
visitPSQLPlpgSQLCursorUpdate: aPSQLPlpgSQLCursorUpdate
	(self childrenFor: aPSQLPlpgSQLCursorUpdate) do: [:aChild | aChild acceptVisitor: self]