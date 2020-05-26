Class {
	#name : #FmxSQLSymbolResolutionVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'function',
		'view',
		'triggerFunction'
	],
	#category : 'FamixNGSQL-Importer-Tests'
}

{ #category : #helpers }
FmxSQLSymbolResolutionVisitorTest >> createColumn: aName inTable: aFmxSQLTable [
	^ FmxSQLColumn new
		columnsContainer: aFmxSQLTable;
		name: aName;
		mooseModel: model;
		yourself
]

{ #category : #helpers }
FmxSQLSymbolResolutionVisitorTest >> createStoredProcedure: aProcedureName [
	^ FmxSQLStoredProcedure new
		name: aProcedureName;
		mooseModel: model;
		yourself
]

{ #category : #helpers }
FmxSQLSymbolResolutionVisitorTest >> createTable: aTableName [
	^ FmxSQLTable new
		name: aTableName;
		mooseModel: model;
		yourself
]

{ #category : #helpers }
FmxSQLSymbolResolutionVisitorTest >> createTable: aTableName withColumns: aCollectionOfColumnNames [
	| table |
	table := self createTable: aTableName.
	aCollectionOfColumnNames do: [ :aColumnName | self createColumn: aColumnName inTable: table ].
	^ table
]

{ #category : #helpers }
FmxSQLSymbolResolutionVisitorTest >> createTrigger: aString calling: aFmxSQLTriggerStoredProcedure onTable: aFmxSQLTable [ 
	^ FmxSQLTrigger new
		name: aString;
		table: aFmxSQLTable;
		storedProcedure: aFmxSQLTriggerStoredProcedure;
		yourself
]

{ #category : #convenient }
FmxSQLSymbolResolutionVisitorTest >> find: aClass in: aCollection thenDo: aBlockClosure [
	^ aCollection
		detect: [ :x | x class = aClass ]
		ifFound: [ :x | aBlockClosure cull: x ]
		ifNone: [ NotFound signalFor: aClass in: aCollection ]
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> parseAndVisitFunction: aFunctionCode [
	^ self parseAndVisitFunction: function withSourceCode: aFunctionCode
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> parseAndVisitFunction: functionForWhichASTNeedsVisit withSourceCode: aFunctionCode [
	| visitor |
	visitor := (FmxSQLSymbolResolutionVisitor model: model function: functionForWhichASTNeedsVisit).
	visitor errorReport 
		catchWarningsDuring: [ 
			(PostgreSQLParser parseStoredProcedureBody: aFunctionCode)
				acceptVisitor: visitor ].
		
	self assert: visitor errorReport errors isEmpty
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> parseAndVisitTriggerFunction: aFunctionCode [
	^ self parseAndVisitFunction: triggerFunction withSourceCode: aFunctionCode
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> parseAndVisitView: aViewCode [
	| visitor |
	visitor := (FmxSQLSymbolResolutionVisitor model: model view: view).
	
	visitor errorReport 
		catchWarningsDuring: [ 
			(PostgreSQLParser parseSelectQuery: aViewCode)
				acceptVisitor: visitor ].
		
	self assert: visitor errorReport errors isEmpty
]

{ #category : #running }
FmxSQLSymbolResolutionVisitorTest >> setUp [
	super setUp.
	model := MooseModel new
					metamodel: FmxSQLMetamodelGenerator metamodel;
					yourself.
	function := FmxSQLStoredProcedure new.
	function mooseModel: model.
	function name: 'currentFunction'.
	
	view := FmxSQLView new
				mooseModel: model;
				name: 'currentView';
				yourself.
				
	triggerFunction := FmxSQLTriggerStoredProcedure new
								mooseModel: model;
								name: 'currentTriggerStoredProcedure';
								yourself
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testAliasedColumnWithAliasBeingTheNameOfATableInFromClause [
	| table |
	table := self createTable: #t withColumns: #(c1 c2).
	
	self parseAndVisitView: 'SELECT t.c1 AS t, t.c2
FROM t'
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testAliasedColumnWithConstantInDefinition [
	| table |
	table := self createTable: #t withColumns: #(c1 c2).
	
	self parseAndVisitView: 'SELECT true AS const, t.c1 AS column1
FROM t
WHERE const = 3'.
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testAliasedColumnWithSameNameAsTable [
	| table |
	table := self createTable: #t withColumns: #(c1 c2).
	
	self parseAndVisitView: 'SELECT t.c1 AS t FROM t'
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testAliasedColumnWithSameNameAsTableAndThenTableStillReferencedThroughTheInitialName [
	| table |
	table := self createTable: #t withColumns: #(c1 c2).
	
	self parseAndVisitView: 'SELECT t.c1 AS t
FROM t
WHERE t.c1 = 1 AND t.c2 = 2' "the 't' here still points on the t in the FROM clause"
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testAliasedDerivedTable [
	| table |
	table := self createTable: #t2 withColumns: #(c2).
	
	self parseAndVisitView: 'SELECT t.c
FROM (SELECT t2.c2 AS c FROM t2) t
WHERE t.c = 1'.
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testAliasingMethodsResult [
	self createTable: 'table1' withColumns: #('column1' 'column2').
	self createStoredProcedure: 'function1'.
	self createStoredProcedure: 'function2'.
	self createStoredProcedure: 'SUM'.
	self
		parseAndVisitFunction:
			'DECLARE
BEGIN
	RETURN QUERY SELECT
		function1(column1,column2)::INTEGER AS res1,
		SUM(function2())::INTEGER AS res2
	FROM
		table1
	GROUP BY res1
	ORDER BY res2;
END;'
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testBuggyColumnAliasInViewSelectQuery [
	self createTable: #t2 withColumns: #(c1).

	
	self parseAndVisitView: 'SELECT t.t2
FROM (SELECT c1 AS t2 FROM t2) t'
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testClassicDeclaration [
	self
		parseAndVisitFunction:
			' DECLARE
      "scope_v"            "delegation_scope";
BEGIN
END;'.
	self assert: function localVariables size equals: 1.
	self assert: function localVariables first name equals: 'scope_v'.
	self assert: function localVariables first type name equals: 'delegation_scope'
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testColumnAliased [
	| table alias referencesGroup |
	table := self createTable: #t withColumns: #(c1 c2).
	
	self parseAndVisitView: 'SELECT t.c1 AS a
FROM t'.

	self assert: table references size equals: 2.
	self assert: (table references count: [ :ref | ref source isSelectClause ]) equals: 1.
	self assert: (table references count: [ :ref | ref source isFromClause ]) equals: 1.
	
	self assert: (table columnNamed: #c1) references size equals: 1.
	self assert: (table columnNamed: #c2) references size equals: 0.
	
	self assert: (table references select: [ :ref | ref source isSelectClause ] thenCollect: [ :ref | ref source ]) asSet size equals: 1.
	self assert: (table references select: [ :ref | ref source isSelectClause ] thenCollect: [ :ref | ref belongsToGroup ]) asSet size equals: 1.
	
	self assert: (model allWithType: FmxSQLColumnAlias) size equals: 1.
	alias := (model allWithType: FmxSQLColumnAlias) first.
	self assert: alias outgoingReferencesGroupReferences size equals: 1.
	referencesGroup := alias outgoingReferencesGroupReferences first to.
	self assertCollection: referencesGroup references hasSameElements: (table references select: [ :ref | ref source isSelectClause ]) , (table columnNamed: #c1) references
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testCopyTypeDeclaration [
	| table columnType column |
	table := FmxSQLTable new
		name: 'unit';
		mooseModel: model;
		yourself.
	columnType := FmxSQLType new
		name: 'myType';
		mooseModel: model;
		yourself.
	column := FmxSQLColumn new
		columnsContainer: table;
		mooseModel: model;
		name: 'id';
		type: columnType;
		yourself.
	self
		parseAndVisitFunction:
			' DECLARE
      "unit_id_v"          "unit"."id"%TYPE;
BEGIN
END;'.
	self assert: function localVariables size equals: 1.
	self assert: function localVariables first name equals: 'unit_id_v'.
	self assert: function localVariables first type equals: columnType
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testCursorDeclaration [
	self
		parseAndVisitFunction:
			' DECLARE
      curs1 refcursor;
BEGIN
END;'.
	self assert: function localVariables size equals: 1.
	self assert: function localVariables first name equals: 'curs1'.
	self assert: function localVariables first type name equals: 'refcursor'
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testCursorDeclaration2 [
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
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testCursorDeclaration3 [
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
	self assert: function outgoingCursorReferences size equals: 1.
	self assert: function outgoingCursorReferences first class equals: FmxSQLCursorReference.
	self assert: function accesses size equals: 1.
	self assert: function accesses first class equals: FmxSQLLocalVariableAccess.
	cursor := function outgoingCursorReferences first cursor.
	self assert: cursor query class equals: FmxSQLSelectQuery.
	self
		find: FmxSQLFromClause
		in: cursor query clauses
		thenDo: [ :fromClause | 
			self assert: fromClause outgoingTableReferences size equals: 1.
			self assert: fromClause outgoingTableReferences first class equals: FmxSQLTableReference.
			self assert: fromClause outgoingTableReferences first table name equals: 'test_table' ]
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testCursorWithParameterDeclaration [
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
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testCursorWithParameterDeclarationAndAccessToIt [
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
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testDeleteQueryInCodeWithWhereAndAnd [
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
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testDoubleAlias [
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
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testReferenceGroupAliased [
	| table alias referencesGroup |
	table := self createTable: #t withColumns: #(c1 c2).
	
	self parseAndVisitView: 'SELECT t.c1 + t.c2 AS a
FROM t'.

	self assert: table references size equals: 3.
	self assert: (table references count: [ :ref | ref source isSelectClause ]) equals: 2.
	self assert: (table references count: [ :ref | ref source isFromClause ]) equals: 1.
	
	self assert: (table columnNamed: #c1) references size equals: 1.
	self assert: (table columnNamed: #c2) references size equals: 1.
	
	self assert: (table references select: [ :ref | ref source isSelectClause ] thenCollect: [ :ref | ref source ]) asSet size equals: 1.
	self assert: (table references select: [ :ref | ref source isSelectClause ] thenCollect: [ :ref | ref belongsToGroup ]) asSet size equals: 1.
	
	self assert: (model allWithType: FmxSQLColumnAlias) size equals: 1.
	alias := (model allWithType: FmxSQLColumnAlias) first.
	self assert: alias outgoingReferencesGroupReferences size equals: 1.
	referencesGroup := alias outgoingReferencesGroupReferences first to.
	self assertCollection: referencesGroup references hasSameElements: (table references select: [ :ref | ref source isSelectClause ]) , (table columnNamed: #c1) references , (table columnNamed: #c2) references
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testReferenceToNewInTriggerStoredProcedure [
	| table trigger newLocalVariable oldLocalVariable |
	table := self createTable: #t withColumns: #(id).
	trigger := self createTrigger: 't_trigger' calling: triggerFunction onTable: table.
	triggerFunction triggers: { trigger }.
	trigger table: table.
	self parseAndVisitTriggerFunction: 'DECLARE
BEGIN
	if (NEW.id = OLD.id) THEN
		RETURN 42;
	END IF;
END;'.

	self assert: triggerFunction localVariables size equals: 2.
	newLocalVariable := triggerFunction localVariables detect: [ :v | v class = FmxSQLNewLocalVariable and: [ v name = 'new' ] ].
	self assert: newLocalVariable columns size equals: 1.
	self assert: newLocalVariable columns first name equals: 'id'.
	oldLocalVariable := triggerFunction localVariables detect: [ :v | v class = FmxSQLOldLocalVariable and: [ v name = 'old' ] ].
	self assert: oldLocalVariable columns size equals: 1.
	self assert: oldLocalVariable columns first name equals: 'id'.
	
	self assert: newLocalVariable accesses size equals: 1.
	self assert: newLocalVariable accesses first from equals: triggerFunction.
	self assert: newLocalVariable columns first references size equals: 1.
	self assert: newLocalVariable columns first references first from equals: triggerFunction.
	
	self assert: oldLocalVariable accesses size equals: 1.
	self assert: oldLocalVariable accesses first from equals: triggerFunction.
	self assert: oldLocalVariable columns first references size equals: 1.
	self assert: oldLocalVariable columns first references first from equals: triggerFunction

]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testResolutionOfAccessOfAttributeForAliasedTable [
	| table selectClause fromClause |
	table := self createTable: #t withColumns: #(t).
	self
		parseAndVisitView:
			'SELECT t.t FROM t'.
	self assert: view queries first clauses size equals: 2.
	selectClause := view queries first clauses detect: [ :c | c class = FmxSQLSelectClause ].
	self assert: selectClause outgoingTableReferences size equals: 1.
	self assert: selectClause outgoingTableReferences first to equals: table.
	self assert: selectClause outgoingColumnReferences size equals: 1.
	self assert: selectClause outgoingColumnReferences first to equals: table columns first.
	
	fromClause := view queries first clauses detect: [ :c | c class = FmxSQLFromClause ].
	self assert: fromClause outgoingTableReferences size equals: 1.
	self assert: fromClause outgoingTableReferences first to equals: table.
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testReturningNewInTriggerStoredProcedure [
	| table trigger |
	table := self createTable: #t withColumns: #(id).
	trigger := self createTrigger: 't_trigger' calling: triggerFunction onTable: table.
	triggerFunction triggers: { trigger }.
	trigger table: table.
	self parseAndVisitTriggerFunction: 'DECLARE
BEGIN
	RETURN NEW;
END;'.
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testRowTypeDeclaration [
	| table |
	table := FmxSQLTable new
		name: 'issue';
		mooseModel: model;
		yourself.
	self
		parseAndVisitFunction:
			' DECLARE
      "issue_row"          "issue"%ROWTYPE;
BEGIN
END;'.
	self assert: function localVariables size equals: 1.
	self assert: function localVariables first name equals: 'issue_row'.
	self assert: function localVariables first type equals: table
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testSelectWithJoinAndAliasing [
	self createTable: #initiative withColumns: #(id issue_id).
	self createTable: #battle withColumns: #(losing_initiative_id).
	self
		parseAndVisitFunction:
			'DECLARE
BEGIN
	SELECT "new_initiative"."id" AS "initiative_id"
		FROM "initiative" "old_initiative"
		JOIN "initiative" "new_initiative"
			ON "new_initiative"."issue_id" = 10
		JOIN "battle" "battle_win"
			ON "battle_win"."losing_initiative_id" = "old_initiative"."id";
END;'.
	
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testSelectWithSubqueryAliasing [
	self parseAndVisitView: ' SELECT subquery.string,
    subquery.major,
    subquery.minor,
    subquery.revision
   FROM ( VALUES (''3.0.5''::text,3,0,5)) subquery(string, major, minor, revision)'
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testSelectWithSubqueryAliasing2 [
	self createTable: 'support' withColumns: #('cle_personne' 'debut' 'cle' 'cle_personne').
	self createStoredProcedure: 'min'.
	self parseAndVisitView: 'SELECT premierssupports.cle_personne,
    premierssupports.min,
    support.cle AS clesupport
   FROM ( SELECT support_1.cle_personne,
            min(support_1.debut) AS min
           FROM support support_1) premierssupports,
    support
  WHERE ((support.cle_personne = premierssupports.cle_personne) AND (support.debut = premierssupports.min))'
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testStoredProcedureInvocation [
	self createStoredProcedure: 'myFunction'.
	self
		parseAndVisitFunction:
			' DECLARE
BEGIN
	myFunction();
END;'
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testStoredProcedureWithForLoop [
	self
		parseAndVisitFunction:
			' DECLARE
	x integer;
BEGIN
	FOR i IN 1..10 LOOP
		x := i;
	END LOOP;
END;'
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testUpdateQueryInFunction [
	self createTable: 'affectation' withColumns: #('fin' 'cle_equipe').
	
	self
		parseAndVisitFunction:
			' DECLARE
BEGIN
	UPDATE affectation SET fin = 1 WHERE cle_equipe = 42 AND (fin IS NULL OR fin >= 3);
END;'.
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testVariableAccess [
	self
		parseAndVisitFunction:
			' DECLARE
      "a"            INT4;
      "b"            INT4;
BEGIN
	"a"         := 0;
	"b"         := "a";
END;'.
	self assert: function localVariables size equals: 2.
	self assert: function localVariables first name equals: 'a'.
	self assert: function localVariables first type name equals: 'int4'.
	self assert: function localVariables second name equals: 'b'.
	self assert: function localVariables second type name equals: 'int4'.
	self assert: function accesses size equals: 3
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testVariableAssignation [
	self
		parseAndVisitFunction:
			' DECLARE
      "a"            INT4;
BEGIN
	"a"         := 0;
END;'.
	self assert: function localVariables size equals: 1.
	self assert: function localVariables first name equals: 'a'.
	self assert: function localVariables first type name equals: 'int4'.
	self assert: function accesses size equals: 1
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testVariableWithTypeRecord [
	self createTable: #t withColumns: #('c1' 'c2').
	self
		parseAndVisitFunction: 'DECLARE
	line RECORD;
	c integer;
BEGIN
	SELECT c1, c2 AS c3 INTO line FROM t WHERE t.c1 = 1;
	c := line.c1 + line.c3;
END;'.
]

{ #category : #parsing }
FmxSQLSymbolResolutionVisitorTest >> testVariableWithTypeRecordWithWildcard [
	self createTable: #t withColumns: #('c1' 'c2').
	self
		parseAndVisitFunction: 'DECLARE
	line RECORD;
	c integer;
BEGIN
	SELECT * INTO line FROM t WHERE t.c1 = 1;
	c := line.c1 + line.c2;
END;'.
]
