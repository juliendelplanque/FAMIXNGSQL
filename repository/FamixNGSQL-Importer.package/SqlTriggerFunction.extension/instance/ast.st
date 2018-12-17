*FamixNGSQL-Importer
ast
	^ (PSQLPlpgSQLASTBuilder parse: (PSQLCommentsRemover parse: self code))
			setChildrenParent;
			yourself