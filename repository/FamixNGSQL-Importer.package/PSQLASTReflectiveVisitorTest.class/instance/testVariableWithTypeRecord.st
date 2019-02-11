parsing
testVariableWithTypeRecord
	self createTable: #t withColumns: #('c1' 'c2').
	self
		parseAndVisitFunction: 'DECLARE
	line RECORD;
	c integer;
BEGIN
	SELECT c1, c2 AS c3 INTO line FROM t WHERE t.c1 = 1;
	c := line.c1 + line.c3;
END;'.