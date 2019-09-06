parsing
testDoubleAlias
	self createTable: #initiative withColumns: #(id).
	self
		parseAndVisitFunction:
			'DECLARE
BEGIN
	SELECT "new_initiative"."id" AS "initiative_id"
		FROM "initiative" "new_initiative";
END;'.
	self assert: function queries size equals: 1.
	self assert: function queries first clauses size equals: 2.
	self
		find: FmxSQLSelectClause
		in: function queries first clauses
		thenDo: [ :selectClause | 
			self assert: selectClause aliases size equals: 1.
			self assert: selectClause aliases first name equals: 'initiative_id' ].
	self
		find: FmxSQLFromClause
		in: function queries first clauses
		thenDo: [ :fromClause | 
			| alias |
			self assert: fromClause aliases size equals: 1.
			alias := fromClause aliases first.
			self assert: alias name equals: 'new_initiative'.
			self assert: alias incomingAccesses size equals: 1 ]