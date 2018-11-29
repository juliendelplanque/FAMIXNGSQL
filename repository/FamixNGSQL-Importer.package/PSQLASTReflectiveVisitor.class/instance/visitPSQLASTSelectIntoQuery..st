visiting
visitPSQLASTSelectIntoQuery: aPSQLASTSelectIntoQuery
	aPSQLASTSelectIntoQuery childrenDo: [:aChild | aChild acceptVisitor: self]