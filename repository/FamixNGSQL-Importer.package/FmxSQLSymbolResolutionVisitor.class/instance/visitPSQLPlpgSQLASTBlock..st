visiting
visitPSQLPlpgSQLASTBlock: aPSQLPlpgSQLASTBlock
	self visit: aPSQLPlpgSQLASTBlock label thenDo: [ :res | Halt now ].
	self visitAll: aPSQLPlpgSQLASTBlock declarations.
	self visitAll: aPSQLPlpgSQLASTBlock statements