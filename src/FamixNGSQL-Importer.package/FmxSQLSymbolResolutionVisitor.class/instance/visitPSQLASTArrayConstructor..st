visiting
visitPSQLASTArrayConstructor: aPSQLASTArrayConstructor
	aPSQLASTArrayConstructor childrenDo: [:aChild | aChild acceptVisitor: self]