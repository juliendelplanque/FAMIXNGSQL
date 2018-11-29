visiting
visitPSQLASTBinaryOperator: aPSQLASTBinaryOperator
	aPSQLASTBinaryOperator childrenDo: [:aChild | aChild acceptVisitor: self]