visiting
visitPSQLPlpgSQLASTCursorDeclaration: aPSQLPlpgSQLASTCursorDeclaration
	| localVariable cursor |
	localVariable := self createEntity: FmxSQLLocalVariable.
	self
		visit: aPSQLPlpgSQLASTCursorDeclaration identifier
		thenDo: [ :variableName | localVariable name: variableName ].
	localVariable type: (self findTypeNamed: 'refcursor').
	localVariable storedProcedure: self currentEntity.
	cursor := self createEntity: FmxSQLCursor from: aPSQLPlpgSQLASTCursorDeclaration.
	self createReferenceTo: cursor.
	self
		useCurrentEntity: cursor
		during: [ self
				visitAll: aPSQLPlpgSQLASTCursorDeclaration arguments.
			self visit: aPSQLPlpgSQLASTCursorDeclaration selectQuery ]