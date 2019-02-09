visiting
visitPSQLASTOrderByClauseItem: aPSQLASTOrderByClauseItem
	aPSQLASTOrderByClauseItem childrenDo: [:aChild | aChild acceptVisitor: self]