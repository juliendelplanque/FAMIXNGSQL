parsing
parseAndVisitFunction: aFunctionCode
	| visitor |
	visitor := (PSQLASTReflectiveVisitor model: model function: function).
	
	(PSQLPlpgSQLASTBuilder parse: (PSQLCommentsRemover parse: aFunctionCode))
		acceptVisitor: visitor.
		
	self assert: visitor errorReport errors isEmpty