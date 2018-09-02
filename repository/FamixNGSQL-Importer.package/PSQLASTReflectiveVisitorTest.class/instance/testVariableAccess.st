parsing
testVariableAccess
	self
		parseAndVisitFunction:
			' DECLARE
      "a"            INT4;
      "b"            INT4;
BEGIN
	"a"         := 0;
	"b"         := "a";
END;'.
	self assert: function localVariables size equals: 2.
	self assert: function localVariables first name equals: 'a'.
	self assert: function localVariables first type name equals: 'int4'.
	self assert: function localVariables second name equals: 'b'.
	self assert: function localVariables second type name equals: 'int4'.
	self assert: function references size equals: 3