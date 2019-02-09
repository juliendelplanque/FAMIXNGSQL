visiting
visitPSQLASTDefaultValue: aPSQLASTDefaultValue
	aPSQLASTDefaultValue childrenDo: [:aChild | aChild acceptVisitor: self]