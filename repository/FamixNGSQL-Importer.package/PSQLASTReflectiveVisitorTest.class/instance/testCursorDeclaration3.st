parsing
testCursorDeclaration3
	| cursor |
	self createTable: 'test_table'.
	self
		parseAndVisitFunction:
			'DECLARE
    curs refcursor;
BEGIN
	OPEN curs FOR SELECT * FROM test_table;
END;'.
	self assert: function localVariables size equals: 1.
	self assert: function localVariables first name equals: 'curs'.
	self assert: function localVariables first type name equals: 'refcursor'.
	self assert: function references size equals: 2.
	self assert: function references second class equals: FmxSQLCursorReference.
	self assert: function references first class equals: FmxSQLLocalVariableAccess.
	cursor := function references second cursor.
	self assert: cursor query class equals: FmxSQLSelectQuery.
	self
		find: FmxSQLFromClause
		in: cursor query clauses
		thenDo: [ :fromClause | 
			self assert: fromClause references size equals: 1.
			self assert: fromClause references first class equals: FmxSQLTableReference.
			self assert: fromClause references first table name equals: 'test_table' ]