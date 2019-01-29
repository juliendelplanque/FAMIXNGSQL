parsing
testCursorWithParameterDeclaration
	| cursor testTable |
	testTable := self createTable: 'test_table'.
	self
		parseAndVisitFunction:
			'DECLARE
    curs2 CURSOR (curs_param integer) FOR SELECT * FROM test_table;
BEGIN
END;'.
	self assert: function localVariables size equals: 1.
	self assert: function localVariables first name equals: 'curs2'.
	self assert: function localVariables first type name equals: 'refcursor'.
	self assert: function outgoingCursorReferences size equals: 1.
	self assert: function outgoingCursorReferences first class equals: FmxSQLCursorReference.
	cursor := function outgoingCursorReferences first cursor.
	self assert: cursor parameters size equals: 1.
	self assert: cursor parameters first name equals: 'curs_param'.
	self assert: cursor parameters first type name equals: 'integer'.
	self assert: cursor query class equals: FmxSQLSelectQuery.
	self
		find: FmxSQLFromClause
		in: cursor query clauses
		thenDo: [ :fromClause | 
			self assert: fromClause outgoingTableReferences size equals: 1.
			self assert: fromClause outgoingTableReferences first class equals: FmxSQLTableReference.
			self assert: fromClause outgoingTableReferences first table equals: testTable ]