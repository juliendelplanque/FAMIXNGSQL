visiting
visitPSQLPlpgSQLASTAssignment: aPSQLPlpgSQLASTAssignment
	self visit: aPSQLPlpgSQLASTAssignment toAssign.
	self flag: #TODO.	"aPSQLPlpgSQLASTAssignment target can be an expression of any kind. The problem is when the expression is only an Identifier because it is not yet referenced."
	self
		visit: aPSQLPlpgSQLASTAssignment target
		thenDo: [ :res | 
			res isString
				ifTrue: [ self resolveAndLinkSilently: (SRIdentifierWithNode identifier: res node: aPSQLPlpgSQLASTAssignment target) ] ]