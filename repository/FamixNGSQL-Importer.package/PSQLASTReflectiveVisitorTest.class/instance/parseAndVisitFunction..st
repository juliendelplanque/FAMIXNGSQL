parsing
parseAndVisitFunction: aFunctionCode
	| visitor |
	visitor := (PSQLASTReflectiveVisitor model: model function: function).
	visitor errorReport 
		catchWarningsDuring: [ 
			(PostgreSQLParser parseStoredProcedureBody: aFunctionCode)
				acceptVisitor: visitor ].
		
	self assert: visitor errorReport errors isEmpty