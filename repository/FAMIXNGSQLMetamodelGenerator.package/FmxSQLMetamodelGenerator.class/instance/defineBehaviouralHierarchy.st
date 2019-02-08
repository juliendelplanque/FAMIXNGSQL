definition - behavioural
defineBehaviouralHierarchy
	"Abstract entities inheritance relations."
	behaviouralEntity --|> namedEntity. "Should be trait (not all behavioural entities have name)"
	behaviouralEntity --|> #TNamespaceEntity.
	crudQuery --|> entity.
	"Concrete structural entities inheritance relations."
	checkConstraint --|> constraint.
	checkConstraint --|> #TWithImmediateSource.
	"Concrete behavioural entities inheritance relations."
	view --|> tAbstractType.
	view --|> tColumnsContainer.
	view --|> tQueryContainer.
	view --|> #TNamespaceEntity.
	view --|> #TWithImmediateSource.
	view --|> namedEntity.
	
	derivedTable --|> behaviouralEntity.
	derivedTable --|> tColumnsContainer.
	derivedTable --|> tQueryContainer.
	
	storedProcedure --|> tQueryContainer.
	storedProcedure --|> namedEntity.
	storedProcedure--|> #TNamespaceEntity.
	storedProcedure --|> #TWithReferences.
	storedProcedure --|> #TInvocable.
	storedProcedure --|> #TWithInvocations.
	storedProcedure --|> #TWithParameters.
	storedProcedure --|> #TWithLocalVariables.
	storedProcedure --|> #TWithAccesses.
	storedProcedure --|> tWithTableReference.
	storedProcedure --|> tWithAlias.
	storedProcedure --|> tWithCursor.
	storedProcedure --|> tWithCursorReference.
	storedProcedure --|> tWithColumnReference. "For COPY TYPE feature of Postgres."
	
	triggerStoredProcedure --|> storedProcedure.
	
	trigger --|> behaviouralEntity.
	trigger --|> #TNamespaceEntity.
	
	selectQuery --|> crudQuery.
	insertQuery --|> crudQuery.
	updateQuery --|> crudQuery.
	deleteQuery --|> crudQuery.
	valuesQuery --|> crudQuery.
	
	parameter --|> namedEntity.
	parameter --|> #TParameter.
	parameter --|> #TAccessible.
	
	localVariable --|> namedEntity.
	localVariable --|> #TLocalVariable.
	localVariable --|> #TAccessible.
	
	newLocalVariable --|> localVariable.
	newLocalVariable --|> tColumnsContainer.
	
	oldLocalVariable --|> localVariable.
	oldLocalVariable --|> tColumnsContainer.
	
	cursorParameter --|> namedEntity.
	cursorParameter --|> #TParameter.
	cursorParameter --|> #TAccessible.
	
	cursor --|> behaviouralEntity.
	cursor --|> tQueryContainer.
	cursor --|> #TWithParameters.
	
	alias --|> namedEntity.
	"alias --|> #TWithAccesses.
	alias --|> #TWithInvocations."
	alias --|> #TAccessible.
	
	columnsContainerAlias --|> alias.
	columnsContainerAlias --|> tWithTableReference.
	columnsContainerAlias --|> tWithDerivedTableReference.
	columnsContainerAlias --|> tWithViewReference.
	
	columnAlias --|> alias.
	columnAlias --|> tWithColumnReference.
	columnAlias --|> tWithReferencesGroupReference.
	columnAlias --|> tColumn.
	
	referencesGroup --|> entity