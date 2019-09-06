parsing
testCursorDeclaration2
	| cursor |
	self createTable: 'test_table'.
	self
		parseAndVisitFunction:
			'DECLARE
    curs2 CURSOR FOR SELECT * FROM test_table;
BEGIN
END;'.
	self assert: function localVariables size equals: 1.
	self assert: function localVariables first name equals: 'curs2'.
	self assert: function localVariables first type name equals: 'refcursor'.
	self assert: function outgoingCursorReferences size equals: 1.
	self assert: function outgoingCursorReferences first class equals: FmxSQLCursorReference.
	cursor := function outgoingCursorReferences first cursor.
	self assert: cursor query class equals: FmxSQLSelectQuery.
	self assert: cursor query clauses size equals: 2.
	self
		find: FmxSQLFromClause
		in: cursor query clauses
		thenDo: [ :fromClause | 
			self assert: fromClause outgoingTableReferences size equals: 1.
			self assert: fromClause outgoingTableReferences first class equals: FmxSQLTableReference.
			self assert: fromClause outgoingTableReferences first table name equals: 'test_table' ]