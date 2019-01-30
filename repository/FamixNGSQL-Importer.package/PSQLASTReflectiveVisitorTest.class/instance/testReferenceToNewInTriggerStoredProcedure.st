parsing
testReferenceToNewInTriggerStoredProcedure
	| table trigger newReference oldReference |
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

	self assert: triggerFunction outgoingUndecidedTableReferences size equals: 2.
	newReference := triggerFunction outgoingUndecidedTableReferences detect: [ :ref | ref class = FmxSQLNewReference ].
	self assert: newReference source equals: triggerFunction.
	self assert: newReference candidates size equals: 1.
	self assert: newReference candidates first equals: table.
	
	oldReference := triggerFunction outgoingUndecidedTableReferences detect: [ :ref | ref class = FmxSQLOldReference ].
	self assert: oldReference source equals: triggerFunction.
	self assert: oldReference candidates size equals: 1.
	self assert: oldReference candidates first equals: table.
