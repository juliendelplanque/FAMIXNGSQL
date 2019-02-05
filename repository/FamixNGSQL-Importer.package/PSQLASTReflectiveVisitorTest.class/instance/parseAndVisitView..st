parsing
parseAndVisitView: aViewCode
	| visitor |
	visitor := (PSQLASTReflectiveVisitor model: model view: view).
	
	visitor errorReport 
		catchWarningsDuring: [ 
			(PostgreSQLParser parseSelectQuery: aViewCode)
				acceptVisitor: visitor ].
		
	self assert: visitor errorReport errors isEmpty