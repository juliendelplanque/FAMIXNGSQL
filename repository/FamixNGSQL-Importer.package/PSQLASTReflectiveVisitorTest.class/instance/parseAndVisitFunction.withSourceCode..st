parsing
parseAndVisitFunction: functionForWhichASTNeedsVisit withSourceCode: aFunctionCode
	| visitor |
	visitor := (PSQLASTReflectiveVisitor model: model function: functionForWhichASTNeedsVisit).
	visitor errorReport 
		catchWarningsDuring: [ 
			(PostgreSQLParser parseStoredProcedureBody: aFunctionCode)
				acceptVisitor: visitor ].
		
	self assert: visitor errorReport errors isEmpty