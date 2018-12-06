visiting
visitPSQLASTCastExpression: aPSQLASTCastExpression 
	aPSQLASTCastExpression childrenDo: [:aChild | aChild acceptVisitor: self]