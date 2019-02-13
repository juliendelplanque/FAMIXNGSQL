visiting
visitPSQLPlpgSQLASTCursorOpenForQuery: aPSQLPlpgSQLASTCursorOpenForQuery
	| cursor |
	self
		visit: aPSQLPlpgSQLASTCursorOpenForQuery cursorIdentifier
		thenDo: [ :cursVar | 
			self
				resolveAndLinkSilently:
					(SRIdentifierWithNode
						identifier: cursVar
						node: aPSQLPlpgSQLASTCursorOpenForQuery cursorIdentifier) ].
	cursor := self createEntity: FmxSQLCursor from: aPSQLPlpgSQLASTCursorOpenForQuery.
	self createReferenceTo: cursor from: aPSQLPlpgSQLASTCursorOpenForQuery.
	self
		useCurrentEntity: cursor
		during: [ self visit: aPSQLPlpgSQLASTCursorOpenForQuery selectQuery ]