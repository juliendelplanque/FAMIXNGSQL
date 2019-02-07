definition - behavioural
defineBehaviouralReferencesHierarchy
	derivedTableReference --|> reference.
	viewReference --|> reference.
	parameterAccess --|> reference.
	parameterAccess --|> #TAccess.
	cursorParameterAccess --|> reference.
	cursorParameterAccess --|> #TAccess.
	storedProcedureCall --|> reference.
	storedProcedureCall --|> #TInvocation.
	localVariableAccess --|> reference.
	localVariableAccess --|> #TAccess.
	cursorReference --|> reference.
	aliasAccess --|> reference.
	aliasAccess --|> #TAccess.
	referencesGroupReference --|> reference.
	referencesGroupReference --|> tReferencesGroupReference