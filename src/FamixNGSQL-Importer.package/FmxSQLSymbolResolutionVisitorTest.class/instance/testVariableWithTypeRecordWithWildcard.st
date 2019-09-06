parsing
testVariableWithTypeRecordWithWildcard
	self createTable: #t withColumns: #('c1' 'c2').
	self
		parseAndVisitFunction: 'DECLARE
	line RECORD;
	c integer;
BEGIN
	SELECT * INTO line FROM t WHERE t.c1 = 1;
	c := line.c1 + line.c2;
END;'.