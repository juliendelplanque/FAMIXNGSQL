parsing
testUpdateQueryInFunction
	self createTable: 'affectation' withColumns: #('fin' 'cle_equipe').
	
	self
		parseAndVisitFunction:
			' DECLARE
BEGIN
	UPDATE affectation SET fin = 1 WHERE cle_equipe = 42 AND (fin IS NULL OR fin >= 3);
END;'.