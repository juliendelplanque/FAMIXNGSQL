parsing
testAliasedDerivedTable
	| table |
	table := self createTable: #t2 withColumns: #(c2).
	
	self parseAndVisitView: 'SELECT t.c
FROM (SELECT t2.c2 AS c FROM t2) t
WHERE t.c = 1'.