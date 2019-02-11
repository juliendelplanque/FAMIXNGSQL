parsing
testCursorDeclaration
	self
		parseAndVisitFunction:
			' DECLARE
      curs1 refcursor;
BEGIN
END;'.
	self assert: function localVariables size equals: 1.
	self assert: function localVariables first name equals: 'curs1'.
	self assert: function localVariables first type name equals: 'refcursor'