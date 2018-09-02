visiting
visitPSQLASTConflictAction: aPSQLASTConflictAction
	(self childrenFor: aPSQLASTConflictAction) do: [:aChild | aChild acceptVisitor: self]