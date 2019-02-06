parsing
testReturningNewInTriggerStoredProcedure
	| table trigger |
	table := self createTable: #t withColumns: #(id).
	trigger := self createTrigger: 't_trigger' calling: triggerFunction onTable: table.
	triggerFunction triggers: { trigger }.
	trigger table: table.
	self parseAndVisitTriggerFunction: 'DECLARE
BEGIN
	RETURN NEW;
END;'.