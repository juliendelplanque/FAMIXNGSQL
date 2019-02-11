parsing
testAliasedColumnWithSameNameAsTableAndThenTableStillReferencedThroughTheInitialName
	| table |
	table := self createTable: #t withColumns: #(c1 c2).
	
	self parseAndVisitView: 'SELECT t.c1 AS t
FROM t
WHERE t.c1 = 1 AND t.c2 = 2' "the 't' here still points on the t in the FROM clause"