visiting
visitPSQLASTExceptClause: aPSQLASTExceptClause
	Halt now.
	(self childrenFor: aPSQLASTExceptClause) do: [:aChild | aChild acceptVisitor: self]