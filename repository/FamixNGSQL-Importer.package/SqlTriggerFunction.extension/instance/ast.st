*FamixNGSQL-Importer
ast
	|parser|
	parser := PSQLPlpgSQLASTBuilder new preProcessor: PSQLTokenizer new comment token ==> [ :p | String new: p stop - p start withAll: Character space ].
	^ (parser parse: self code)
			setChildrenParent;
			sourceCode: self code;
			yourself