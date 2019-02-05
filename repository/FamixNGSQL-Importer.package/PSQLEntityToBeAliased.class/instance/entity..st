accessing
entity: anObject
	self assert: anObject isNotNil.
	self assert: anObject class ~= PSQLASTReflectiveVisitor.
	entity := anObject