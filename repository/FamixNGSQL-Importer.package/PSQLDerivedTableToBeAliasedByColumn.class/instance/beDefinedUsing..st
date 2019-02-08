defining
beDefinedUsing: aPSQLASTReflectiveVisitor
	|fromClause|
	fromClause := (aPSQLASTReflectiveVisitor solver peekScopeAtIndex: 2) entity.
	self assert: fromClause class = FmxSQLFromClause.
	(self aliasHasTheSameNameAsOneOfTheColumnsContainerIn: fromClause)
			ifTrue: [ ^ self ].
	
	aPSQLASTReflectiveVisitor createFmxSQLColumnAliasNamed: self alias forDerivedTable: self entity.
	aPSQLASTReflectiveVisitor defineAliasInCurrentScope: self alias for: self entity.