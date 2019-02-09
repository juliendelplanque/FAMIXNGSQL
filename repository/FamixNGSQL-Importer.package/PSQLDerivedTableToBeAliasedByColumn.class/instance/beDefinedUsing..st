defining
beDefinedUsing: aPSQLASTReflectiveVisitor
	|fromClause|
	fromClause := (aPSQLASTReflectiveVisitor solver peekScopeAtIndex: 2) entity.
	self assert: fromClause class = FmxSQLFromClause.
	aPSQLASTReflectiveVisitor createFmxSQLColumnAliasNamed: self alias forDerivedTable: self entity.
	(self aliasHasTheSameNameAsOneOfTheColumnsContainerIn: fromClause)
			ifTrue: [ ^ self ].
	
	aPSQLASTReflectiveVisitor defineAliasInCurrentScope: self alias for: self entity.