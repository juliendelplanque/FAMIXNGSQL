as yet unclassified
beDefinedUsing: aPSQLASTReflectiveVisitor
	|fromClause|
	"The following test checks whether the alias to be defined has the same name as a columns container in the
	 FROM clause. If it does, we do not define the alias in the current scope because in PostgreSQL, the only
	 effect of the alias in this configuration is to provide the name of the column for the derived table."
	fromClause := (aPSQLASTReflectiveVisitor solver peekScopeAtIndex: 2) entity.
	self assert: fromClause class = FmxSQLFromClause.
	(fromClause reachableEntities
		anySatisfy: [ :any | any isColumnsContainer and: [ any name = self alias ] ])
			ifTrue: [ ^ self ].
	
	aPSQLASTReflectiveVisitor createFmxSQLAliasNamed: self alias forCurrentEntity: self entity.
	aPSQLASTReflectiveVisitor defineAliasInCurrentScope: self alias for: self entity.