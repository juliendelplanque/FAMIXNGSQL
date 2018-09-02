visiting
visitPSQLASTExceptionHandler: aPSQLASTExceptionHandler
	self visitAll: aPSQLASTExceptionHandler declarations.
	self visitAll: aPSQLASTExceptionHandler statements.
	self visitAll: aPSQLASTExceptionHandler exceptionCases