visiting
visitPSQLPlpgSQLASTClassicDeclaration: aPSQLPlpgSQLASTClassicDeclaration
	| variableClass variable type |
	type := self visit: aPSQLPlpgSQLASTClassicDeclaration type.
	variableClass := type name = 'record'
							ifTrue: [ FmxSQLRecordLocalVariable ]
							ifFalse: [ FmxSQLLocalVariable ].
	variable := self createEntity: variableClass from: aPSQLPlpgSQLASTClassicDeclaration.
	variable type: type.
	variable parentBehaviouralEntity: self function.
	self visit: aPSQLPlpgSQLASTClassicDeclaration defaultExpression thenDo: [ :e | Halt now ].
	self
		visit: aPSQLPlpgSQLASTClassicDeclaration identifier
		thenDo: [ :name | variable name: name ].
	^ variable