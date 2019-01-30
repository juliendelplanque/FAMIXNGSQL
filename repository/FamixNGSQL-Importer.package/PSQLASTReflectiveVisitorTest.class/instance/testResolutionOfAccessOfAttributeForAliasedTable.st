parsing
testResolutionOfAccessOfAttributeForAliasedTable
	| table selectClause fromClause |
	table := self createTable: #t withColumns: #(t).
	self
		parseAndVisitView:
			'SELECT t.t FROM t'.
	self assert: view queries first clauses size equals: 2.
	selectClause := view queries first clauses detect: [ :c | c class = FmxSQLSelectClause ].
	self assert: selectClause outgoingTableReferences size equals: 1.
	self assert: selectClause outgoingTableReferences first to equals: table.
	self assert: selectClause outgoingColumnReferences size equals: 1.
	self assert: selectClause outgoingColumnReferences first to equals: table columns first.
	
	fromClause := view queries first clauses detect: [ :c | c class = FmxSQLFromClause ].
	self assert: fromClause outgoingTableReferences size equals: 1.
	self assert: fromClause outgoingTableReferences first to equals: table.