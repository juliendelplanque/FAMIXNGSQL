visiting
visitPSQLPlpgSQLASTQueryResultsLoop: aPSQLPlpgSQLASTQueryResultsLoop
	(self childrenFor: aPSQLPlpgSQLASTQueryResultsLoop) do: [:aChild | aChild acceptVisitor: self]