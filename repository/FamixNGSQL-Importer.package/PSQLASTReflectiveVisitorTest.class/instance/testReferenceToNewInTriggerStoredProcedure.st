parsing
testReferenceToNewInTriggerStoredProcedure
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
