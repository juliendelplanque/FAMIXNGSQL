visiting
visitPSQLASTDefaultValues: aPSQLASTDefaultValues
	aPSQLASTDefaultValues childrenDo: [:aChild | aChild acceptVisitor: self]