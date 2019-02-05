definition
defineReferenceHierarchy
	reference --|> association.
	reference --|> #TArgument.
	
	tableReference --|> reference.
	
	derivedTableReference --|> reference.
	
	viewReference --|> reference.
	
	parameterAccess --|> reference.
	parameterAccess --|> #TAccess.
	
	cursorParameterAccess --|> reference.
	cursorParameterAccess --|> #TAccess.
	
	columnReference --|> reference.
	
	typeReference --|> reference.
	
	storedProcedureCall --|> reference.
	storedProcedureCall --|> #TInvocation.
	
	localVariableAccess --|> reference.
	localVariableAccess --|> #TAccess.
	
	cursorReference --|> reference.
	
	aliasAccess --|> reference.
	aliasAccess --|> #TAccess.
	
	newReference --|> reference.
	newReference --|> tUndecidedTableReference.
	
	oldReference --|> reference.
	oldReference --|> tUndecidedTableReference.
	
	referencesGroupReference --|> reference.
	referencesGroupReference --|> tReferencesGroupReference