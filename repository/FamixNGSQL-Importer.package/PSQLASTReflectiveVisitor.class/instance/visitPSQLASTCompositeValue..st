visiting
visitPSQLASTCompositeValue: aPSQLASTCompositeValue
	aPSQLASTCompositeValue childrenDo: [:aChild | aChild acceptVisitor: self]