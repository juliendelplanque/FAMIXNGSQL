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
	cursor := function outgoingCursorReferences first cursor.
	self assert: cursor query clauses size equals: 2.
	self
		find: FmxSQLSelectClause
		in: cursor query clauses
		thenDo: [ :selectClause | 
			self assert: selectClause accesses size equals: 1.
			self assert: selectClause accesses first class equals: FmxSQLCursorParameterAccess.
			self assert: selectClause accesses first variable equals: cursor parameters first ]