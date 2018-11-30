*FamixNGSQL-Importer
ast
	^ PSQLSelectQueryASTBuilder parse: (PSQLCommentsRemover parse: self code)