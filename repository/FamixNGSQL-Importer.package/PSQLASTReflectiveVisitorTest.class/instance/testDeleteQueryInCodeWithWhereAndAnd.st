parsing
testDeleteQueryInCodeWithWhereAndAnd
	| query fromClause whereClause tableInFrom |
	tableInFrom := self createTable: 'direct_population_snapshot' withColumns: #('issue_id' 'event').
	self
		parseAndVisitFunction:
			' DECLARE
BEGIN
	DELETE FROM "direct_population_snapshot"
        WHERE "issue_id" = "issue_id_p"
        AND "event" = ''periodic'';
END;'.

	self assert: function queries size equals: 1.
	query := function queries first.
	self assert: query class equals: FmxSQLDeleteQuery.
	self assert: query clauses size equals: 2.
	fromClause := query clauses detect: [ :clause | clause class = FmxSQLFromClause ].
	self assert: fromClause references size equals: 1.
	self assert: fromClause references first class equals: FmxSQLTableReference.
	self assert: fromClause references first table equals: tableInFrom.
	whereClause := query clauses detect: [ :clause | clause class = FmxSQLWhereClause ].
	self assert: whereClause references size equals: 3.