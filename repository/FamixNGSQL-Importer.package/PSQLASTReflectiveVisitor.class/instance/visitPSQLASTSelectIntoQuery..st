visiting
visitPSQLASTSelectIntoQuery: aPSQLASTSelectIntoQuery
	self flag: #TODO. "Deal with the INTO identifier."
	^ self visitPSQLASTSelectQuery: aPSQLASTSelectIntoQuery