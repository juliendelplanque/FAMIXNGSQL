parsing
testAliasedColumnWithSameNameAsTable
	| table |
	table := self createTable: #t withColumns: #(c1 c2).
	
	self parseAndVisitView: 'SELECT t.c1 AS t FROM t'