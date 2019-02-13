visiting
visitPSQLASTFunctionCall: aPSQLASTFunctionCall
	self createReferenceTo: (self findStoredProcedureNamed: (self visit: aPSQLASTFunctionCall functionIdentifier)) from: aPSQLASTFunctionCall.
	self visitAll: aPSQLASTFunctionCall argumentsList.
	Halt if: aPSQLASTFunctionCall argumentsDictionary notEmpty