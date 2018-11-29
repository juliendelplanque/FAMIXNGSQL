visiting
visitPSQLASTPrefixOperator: aPSQLASTPrefixOperator
	aPSQLASTPrefixOperator childrenDo: [:aChild | aChild acceptVisitor: self]