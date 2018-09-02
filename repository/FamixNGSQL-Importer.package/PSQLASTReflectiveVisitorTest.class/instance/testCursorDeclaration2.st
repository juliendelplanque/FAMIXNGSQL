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
	self assert: function references size equals: 1.
	self assert: function references first class equals: FmxSQLCursorReference.
	cursor := function references first cursor.
	self assert: cursor query class equals: FmxSQLSelectQuery.
	self assert: cursor query clauses size equals: 2.
	self
		find: FmxSQLFromClause
		in: cursor query clauses
		thenDo: [ :fromClause | 
			self assert: fromClause references size equals: 1.
			self assert: fromClause references first class equals: FmxSQLTableReference.
			self assert: fromClause references first table name equals: 'test_table' ]