parsing
parseAndVisitTriggerFunction: aFunctionCode
	| visitor |
	visitor := (PSQLASTReflectiveVisitor model: model function: triggerFunction).
	
	(PSQLPlpgSQLASTBuilder parse: (PSQLCommentsRemover parse: aFunctionCode))
		acceptVisitor: visitor.
		
	self assert: visitor errorReport errors isEmpty