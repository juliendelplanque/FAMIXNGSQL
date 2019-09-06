definition - behavioural
defineBehaviouralEntities
	"Abstract entities."
	behaviouralEntity := builder newTraitNamed: #BehaviouralEntity.
	"Concrete behavioural entities."
	view := builder newClassNamed: #View comment: self viewComment.
	view withTesting.
	derivedTable := builder
		newClassNamed: #DerivedTable
		comment: self derivedTableComment.
	crudQuery := builder
		newClassNamed: #CRUDQuery
		comment: self crudQueryComment.
	storedProcedure := builder
		newClassNamed: #StoredProcedure
		comment: self storedProcedureComment.
	storedProcedure withTesting.
	triggerStoredProcedure := builder
		newClassNamed: #TriggerStoredProcedure
		comment: self triggerStoredProcedureComment.
	trigger := builder
		newClassNamed: #Trigger
		comment: self triggerComment.
	selectQuery := builder
		newClassNamed: #SelectQuery
		comment: self selectQueryComment.
	insertQuery := builder
		newClassNamed: #InsertQuery
		comment: self insertQueryComment.
	updateQuery := builder
		newClassNamed: #UpdateQuery
		comment: self updateQueryComment.
	deleteQuery := builder
		newClassNamed: #DeleteQuery
		comment: self deleteQueryComment.
	valuesQuery := builder
		newClassNamed: #ValuesQuery
		comment: self valuesQueryComment.
	parameter := builder
		newClassNamed: #Parameter
		comment: self parameterComment.
	localVariable := builder
		newClassNamed: #LocalVariable
		comment: self localVariableComment.
	recordLocalVariable := builder
		newClassNamed: #RecordLocalVariable
		comment: self recordLocalVariableComment.
	newLocalVariable := builder
		newClassNamed: #NewLocalVariable
		comment: self newLocalVariableComment.
	oldLocalVariable := builder
		newClassNamed: #OldLocalVariable
		comment: self oldLocalVariableComment.
	cursor := builder newClassNamed: #Cursor comment: self cursorComment.
	cursorParameter := builder
		newClassNamed: #CursorParameter
		comment: 'I am a cursor parameter'.
	alias := builder newClassNamed: #Alias comment: self aliasComment.
	alias withTesting.
	columnsContainerAlias := builder
		newClassNamed: #ColumnsContainerAlias
		comment: self columnsContainerAliasComment.
	columnAlias := builder
		newClassNamed: #ColumnAlias
		comment: self columnAliasComment.
	"Concrete reference entities."
	viewReference := builder
		newClassNamed: #ViewReference
		comment: self viewReferenceComment.
	derivedTableReference := builder
		newClassNamed: #DerivedTableReference
		comment: self derivedTableReferenceComment.
	parameterAccess := builder
		newClassNamed: #ParameterAccess
		comment: self parameterAccessComment.
	parameterAccess withTesting.
	cursorParameterAccess := builder
		newClassNamed: #CursorParameterAccess
		comment: self cursorParameterAccessComment.
	cursorReference := builder
		newClassNamed: #CursorReference
		comment: self cursorReferenceComment.
	storedProcedureCall := builder
		newClassNamed: #StoredProcedureCall
		comment: self storedProcedureCallComment.
	storedProcedureCall withTesting.
	localVariableAccess := builder
		newClassNamed: #LocalVariableAccess
		comment: self localVariableAccessComment.
	localVariableAccess withTesting.
	aliasAccess := builder
		newClassNamed: #AliasAccess
		comment: self aliasAccessComment.
	aliasAccess withTesting.
	columnAliasAccess := builder
		newClassNamed: #ColumnAliasAccess.
	columnsContainerAliasAccess := builder
		newClassNamed: #ColumnsContainerAliasAccess.
	referencesGroup := builder
		newClassNamed: #ReferencesGroup
		comment: self referencesGroupComment.
	referencesGroupReference := builder
		newClassNamed: #ReferencesGroupReference
		comment: self referencesGroupReferenceComment.
	foreignTable := builder
		newClassNamed: #ForeignTable
		comment: self foreignTableComment.
	entitySourceAnchor := builder
		newClassNamed: #EntitySourceAnchor
		comment: self entitySourceAnchorComment.
	entitySourceAnchor withTesting.