visiting
visitPSQLASTHavingClause: aPSQLASTHavingClause
	(self childrenFor: aPSQLASTHavingClause) do: [:aChild | aChild acceptVisitor: self]