accessing
alias: anObject
	self assert: anObject isNotNil.
	self assert: anObject class ~= PSQLASTReflectiveASTVisitor.
	alias := anObject