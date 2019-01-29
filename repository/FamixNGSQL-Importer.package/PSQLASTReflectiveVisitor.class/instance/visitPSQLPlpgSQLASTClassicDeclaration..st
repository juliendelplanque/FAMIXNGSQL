visiting
visitPSQLPlpgSQLASTClassicDeclaration: aPSQLPlpgSQLASTClassicDeclaration
	| variable |
	variable := self createEntity: FmxSQLLocalVariable from: aPSQLPlpgSQLASTClassicDeclaration.
	variable parentBehaviouralEntity: self function.
	self visit: aPSQLPlpgSQLASTClassicDeclaration defaultExpression thenDo: [ :e | Halt now ].
	self
		visit: aPSQLPlpgSQLASTClassicDeclaration identifier
		thenDo: [ :name | variable name: name ].
	self visit: aPSQLPlpgSQLASTClassicDeclaration type thenDo: [ :type | variable type: type ].
	^ variable