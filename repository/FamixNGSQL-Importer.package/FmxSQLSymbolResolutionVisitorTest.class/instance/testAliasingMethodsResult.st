parsing
testAliasingMethodsResult
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