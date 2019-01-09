parsing
parseAndVisitView: aViewCode
	| visitor |
	visitor := (PSQLASTReflectiveVisitor model: model view: view).
	
	(PSQLSelectQueryASTBuilder parse: (PSQLCommentsRemover parse: aViewCode))
		acceptVisitor: visitor.
		
	self assert: visitor errorReport errors isEmpty