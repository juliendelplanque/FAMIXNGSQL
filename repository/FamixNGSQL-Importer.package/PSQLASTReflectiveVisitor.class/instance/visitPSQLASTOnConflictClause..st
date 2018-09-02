visiting
visitPSQLASTOnConflictClause: aPSQLASTOnConflictClause
	(self childrenFor: aPSQLASTOnConflictClause) do: [:aChild | aChild acceptVisitor: self]