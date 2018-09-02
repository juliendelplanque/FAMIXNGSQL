visiting
visitPSQLASTCursorParameter: aPSQLASTCursorParameter
	| parameter |
	parameter := self createEntity: FmxSQLCursorParameter from: aPSQLASTCursorParameter.
	parameter
		name: (self visit: aPSQLASTCursorParameter parameterName);
		type: (self findTypeNamed: (self visit: aPSQLASTCursorParameter type));
		cursor: self currentEntity.
	^ parameter