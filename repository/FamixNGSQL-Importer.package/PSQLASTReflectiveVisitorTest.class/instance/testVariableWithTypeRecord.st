parsing
testVariableWithTypeRecord
	self createTable: #t withColumns: #('c1' 'c2').
	self
		parseAndVisitFunction: 'DECLARE
	line RECORD;
	c integer;
BEGIN
	SELECT c1, c2 INTO line FROM t WHERE t.c1 = 1;
	c := row.c1;
END;'.