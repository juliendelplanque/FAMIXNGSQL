defining
beDefinedUsing: aPSQLASTReflectiveVisitor
	|fromClause aliasEntity |
	fromClause := (aPSQLASTReflectiveVisitor solver peekScopeAtIndex: 2) entity.
	self assert: fromClause class = FmxSQLFromClause.
	(self aliasHasTheSameNameAsOneOfTheColumnsContainerIn: fromClause)
			ifTrue: [ ^ self ].
	
	aliasEntity := aPSQLASTReflectiveVisitor createFmxSQLAliasNamed: self alias.
	aPSQLASTReflectiveVisitor defineAliasInCurrentScope: self alias for: aliasEntity.