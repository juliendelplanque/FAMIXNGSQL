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
	self assert: function references size equals: 1.
	self assert: function references first class equals: FmxSQLCursorReference.
	cursor := function references first cursor.
	self assert: cursor parameters size equals: 1.
	self assert: cursor parameters first name equals: 'curs_param'.
	self assert: cursor parameters first type name equals: 'integer'.
	self assert: cursor query class equals: FmxSQLSelectQuery.
	self
		find: FmxSQLFromClause
		in: cursor query clauses
		thenDo: [ :fromClause | 
			self assert: fromClause references size equals: 1.
			self assert: fromClause references first class equals: FmxSQLTableReference.
			self assert: fromClause references first table equals: testTable ]