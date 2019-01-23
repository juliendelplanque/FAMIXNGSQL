definition
defineReferenceHierarchy
	reference --|> association.
	reference --|> #TArgument.
	tableReference --|> reference.
	derivedTableReference --|> reference.
	viewReference --|> reference.
	parameterAccess --|> reference.
	cursorParameterAccess --|> reference.
	columnReference --|> reference.
	typeReference --|> reference.
	storedProcedureCall --|> reference.
	localVariableAccess --|> reference.
	cursorReference --|> reference.
	aliasAccess --|> reference.