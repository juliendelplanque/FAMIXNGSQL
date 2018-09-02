parsing
testStoredProcedureInvocation
	self createStoredProcedure: 'myFunction'.
	self
		parseAndVisitFunction:
			' DECLARE
BEGIN
	myFunction();
END;'