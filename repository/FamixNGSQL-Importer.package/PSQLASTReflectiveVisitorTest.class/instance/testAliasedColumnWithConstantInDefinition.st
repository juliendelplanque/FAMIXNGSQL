parsing
testAliasedColumnWithConstantInDefinition
	| table |
	table := self createTable: #t withColumns: #(c1 c2).
	
	self parseAndVisitView: 'SELECT true AS const, t.c1 AS column1
FROM t
WHERE const = 3'.