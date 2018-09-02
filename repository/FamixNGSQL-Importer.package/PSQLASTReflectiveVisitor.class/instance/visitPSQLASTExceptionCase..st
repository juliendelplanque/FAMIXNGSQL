visiting
visitPSQLASTExceptionCase: aPSQLASTExceptionCase
	self visit: aPSQLASTExceptionCase exception.
	self visitAll: aPSQLASTExceptionCase statements