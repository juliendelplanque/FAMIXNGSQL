visiting
visitPSQLPlpgSQLASTForLoop: aPSQLPlpgSQLASTForLoop
	| counterIdentifier |
	counterIdentifier := PSQLASTIgnoredLocalVariableNullObject new
									name: (self visit: aPSQLPlpgSQLASTForLoop target);
									yourself.
	
	self visit: aPSQLPlpgSQLASTForLoop fromExpression.
	self visit: aPSQLPlpgSQLASTForLoop toExpression.
	
	self useCurrentEntity: counterIdentifier during: [ 
		self visitAll: aPSQLPlpgSQLASTForLoop statements ]