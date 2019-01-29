parsing
testVariableAssignation
	self
		parseAndVisitFunction:
			' DECLARE
      "a"            INT4;
BEGIN
	"a"         := 0;
END;'.
	self assert: function localVariables size equals: 1.
	self assert: function localVariables first name equals: 'a'.
	self assert: function localVariables first type name equals: 'int4'.
	self assert: function accesses size equals: 1