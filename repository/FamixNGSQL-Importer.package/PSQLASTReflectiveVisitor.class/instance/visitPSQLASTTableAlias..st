visiting
visitPSQLASTTableAlias: aPSQLASTTableAlias
	aPSQLASTTableAlias childrenDo: [:aChild | aChild acceptVisitor: self]