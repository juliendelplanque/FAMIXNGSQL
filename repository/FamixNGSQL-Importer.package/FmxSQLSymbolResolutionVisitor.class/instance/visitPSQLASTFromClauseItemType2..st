visiting
visitPSQLASTFromClauseItemType2: aPSQLASTFromClauseItemType2
	| alias fmxAlias valueOrSelect derivedTable |
	alias := self visit: aPSQLASTFromClauseItemType2 alias.
	valueOrSelect := (self visit: aPSQLASTFromClauseItemType2 valuesOrSelect) entity query.
	derivedTable := (self createEntity: FmxSQLDerivedTable)
							query: valueOrSelect;
							columns: (valueOrSelect clauses
								detect: [ :c | c class = FmxSQLSelectClause ]
								ifFound: [ :selectClause |
									selectClause aliases ]
								ifNone: [ #() ]);
							yourself.
	fmxAlias := self
		createFmxSQLAliasNamed: alias
		forCurrentEntity: derivedTable.
	self visitAll: aPSQLASTFromClauseItemType2 columnAliases thenDoForEach: [ :columnAliasName | 
		(self createEntity: FmxSQLColumnAlias)
			name: columnAliasName;
			columnsContainerAlias: fmxAlias ].