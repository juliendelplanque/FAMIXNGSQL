defining
beDefinedUsing: aPSQLASTReflectiveVisitor
	|fromClause|
	fromClause := (aPSQLASTReflectiveVisitor solver peekScopeAtIndex: 2) entity.
	self assert: fromClause class = FmxSQLFromClause.
	aPSQLASTReflectiveVisitor createFmxSQLAliasNamed: self alias forCurrentEntity: self entity nodeForReference: self astNode.
	(self aliasHasTheSameNameAsOneOfTheColumnsContainerIn: fromClause)
			ifTrue: [ ^ self ].
	
	aPSQLASTReflectiveVisitor defineAliasInCurrentScope: self alias for: self entity