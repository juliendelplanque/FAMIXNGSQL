visiting
visitPSQLPlpgSQLASTRaiseStatement: aPSQLPlpgSQLASTRaiseStatement
	aPSQLPlpgSQLASTRaiseStatement childrenDo: [:aChild | aChild acceptVisitor: self]