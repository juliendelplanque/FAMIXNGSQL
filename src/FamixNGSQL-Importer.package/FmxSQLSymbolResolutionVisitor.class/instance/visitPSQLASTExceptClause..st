visiting
visitPSQLASTExceptClause: aPSQLASTExceptClause
	Halt now.
	aPSQLASTExceptClause childrenDo: [:aChild | aChild acceptVisitor: self]