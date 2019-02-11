parsing
testStoredProcedureWithForLoop
	self
		parseAndVisitFunction:
			' DECLARE
	x integer;
BEGIN
	FOR i IN 1..10 LOOP
		x := i;
	END LOOP;
END;'