parsing
testCursorWithParameterDeclarationAndAccessToIt
	| cursor |
	self createTable: 'test_table'.
	self
		parseAndVisitFunction:
			'DECLARE
    curs2 CURSOR (curs_param integer) FOR SELECT curs_param, * FROM test_table;
BEGIN
END;'.
	cursor := function references first cursor.
	self assert: cursor query clauses size equals: 2.
	self
		find: FmxSQLSelectClause
		in: cursor query clauses
		thenDo: [ :selectClause | 
			self assert: selectClause references size equals: 1.
			self assert: selectClause references first class equals: FmxSQLCursorParameterAccess.
			self assert: selectClause references first parameter equals: cursor parameters first ]