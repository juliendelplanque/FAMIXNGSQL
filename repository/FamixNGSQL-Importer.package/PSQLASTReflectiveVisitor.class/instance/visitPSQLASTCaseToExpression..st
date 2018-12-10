visiting
visitPSQLASTCaseToExpression: aPSQLASTCaseToExpression
	aPSQLASTCaseToExpression childrenDo: [:aChild | aChild acceptVisitor: self]