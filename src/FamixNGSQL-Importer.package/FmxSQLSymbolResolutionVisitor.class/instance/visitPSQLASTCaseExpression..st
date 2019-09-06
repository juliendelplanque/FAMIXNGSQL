visiting
visitPSQLASTCaseExpression: aPSQLASTCaseExpression
	aPSQLASTCaseExpression childrenDo: [:aChild | aChild acceptVisitor: self]