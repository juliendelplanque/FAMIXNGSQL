parsing
parseAndVisitFunction: functionForWhichASTNeedsVisit withSourceCode: aFunctionCode
	| visitor |
	visitor := (FmxSQLSymbolResolutionVisitor model: model function: functionForWhichASTNeedsVisit).
	visitor errorReport 
		catchWarningsDuring: [ 
			(PostgreSQLParser parseStoredProcedureBody: aFunctionCode)
				acceptVisitor: visitor ].
		
	self assert: visitor errorReport errors isEmpty