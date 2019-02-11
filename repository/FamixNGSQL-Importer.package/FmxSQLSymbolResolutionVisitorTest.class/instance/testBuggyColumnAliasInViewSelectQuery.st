parsing
testBuggyColumnAliasInViewSelectQuery
	self createTable: #t2 withColumns: #(c1).

	
	self parseAndVisitView: 'SELECT t.t2
FROM (SELECT c1 AS t2 FROM t2) t'