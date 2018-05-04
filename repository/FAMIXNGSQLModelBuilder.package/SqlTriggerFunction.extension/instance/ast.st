*FAMIXNGSQLModelBuilder
ast
	^ PSQLPlpgSQLASTBuilder parse: (PSQLCommentsRemover parse: self code)