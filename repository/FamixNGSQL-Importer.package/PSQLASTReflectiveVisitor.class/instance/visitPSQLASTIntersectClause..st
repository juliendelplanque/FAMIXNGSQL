visiting
visitPSQLASTIntersectClause: aPSQLASTIntersectClause
	Halt now.
	(self childrenFor: aPSQLASTIntersectClause) do: [:aChild | aChild acceptVisitor: self]