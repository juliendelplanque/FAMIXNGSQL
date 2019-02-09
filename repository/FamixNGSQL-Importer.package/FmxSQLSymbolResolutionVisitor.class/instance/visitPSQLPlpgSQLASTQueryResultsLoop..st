visiting
visitPSQLPlpgSQLASTQueryResultsLoop: aPSQLPlpgSQLASTQueryResultsLoop
	aPSQLPlpgSQLASTQueryResultsLoop childrenDo: [:aChild | aChild acceptVisitor: self]