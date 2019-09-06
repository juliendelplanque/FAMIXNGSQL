parsing
testDeleteQueryInCodeWithWhereAndAnd
	| query fromClause whereClause tableInFrom |
	tableInFrom := self createTable: 'direct_population_snapshot' withColumns: #('issue_id' 'event').
	function parameters
		add: (FmxSQLParameter new
					name: 'issue_id_p';
					yourself).
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
	self assert: fromClause outgoingTableReferences size equals: 1.
	self assert: fromClause outgoingTableReferences first class equals: FmxSQLTableReference.
	self assert: fromClause outgoingTableReferences first table equals: tableInFrom.
	whereClause := query clauses detect: [ :clause | clause class = FmxSQLWhereClause ].
	self assert: whereClause outgoingColumnReferences size equals: 2.
	self assert: whereClause accesses size equals: 1.