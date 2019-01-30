parsing
testAliasedColumnWithSameNameAsTableAndThenTableStillReferencedThroughTheInitialName
	| table |
	table := self createTable: #t withColumns: #(c1 c2).
	
	self parseAndVisitView: 'SELECT t.c1 AS t
FROM t
WHERE t = 1 AND t.c2 = 2'