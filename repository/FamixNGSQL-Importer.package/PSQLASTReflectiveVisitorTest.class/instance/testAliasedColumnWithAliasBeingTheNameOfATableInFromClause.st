parsing
testAliasedColumnWithAliasBeingTheNameOfATableInFromClause
	| table |
	table := self createTable: #t withColumns: #(c1 c2).
	
	self parseAndVisitView: 'SELECT t.c1 AS t, t.c2
FROM t'