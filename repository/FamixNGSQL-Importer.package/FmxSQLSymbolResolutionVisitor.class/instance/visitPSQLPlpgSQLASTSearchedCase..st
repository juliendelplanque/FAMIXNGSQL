visiting
visitPSQLPlpgSQLASTSearchedCase: aPSQLPlpgSQLASTSearchedCase
	aPSQLPlpgSQLASTSearchedCase childrenDo: [:aChild | aChild acceptVisitor: self]