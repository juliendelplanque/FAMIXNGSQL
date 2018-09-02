parsing
testClassicDeclaration
	self
		parseAndVisitFunction:
			' DECLARE
      "scope_v"            "delegation_scope";
BEGIN
END;'.
	self assert: function localVariables size equals: 1.
	self assert: function localVariables first name equals: 'scope_v'.
	self assert: function localVariables first type name equals: 'delegation_scope'