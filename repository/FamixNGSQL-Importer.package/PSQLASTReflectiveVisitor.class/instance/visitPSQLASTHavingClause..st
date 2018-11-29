visiting
visitPSQLASTHavingClause: aPSQLASTHavingClause
	aPSQLASTHavingClause childrenDo: [:aChild | aChild acceptVisitor: self]