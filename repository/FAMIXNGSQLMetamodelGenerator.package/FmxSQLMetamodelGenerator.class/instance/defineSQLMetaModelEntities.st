definitions - SQL
defineSQLMetaModelEntities
	"Abstract entities."
	tEntityInNamespace := builder newTraitNamed: #EntityInNamespace comment: self entityInNamespaceComment.
	structuralEntity := builder newClassNamed: #StructuralEntity comment: self structuralEntityComment.
	constraint := builder newClassNamed: #Constraint comment: self constraintComment.
	tColumnsContainer := builder newTraitNamed: #ColumnsContainer comment: self columnsContainerComment.
	queryContainer := builder newClassNamed: #QueryContainer comment: self queryContainerComment.
	crudQuery := builder newClassNamed: #CRUDQuery comment: self crudQueryComment.
	reference := builder newClassNamed: #Reference comment: self referenceComment.
	tReferenceContainer := builder newTraitNamed: #TReferenceContainer comment: self tReferenceContainerComment.
	"Concrete structural entities."
	namespace := builder newClassNamed: #Namespace comment: self namespaceComment.
	table := builder newClassNamed: #Table comment: self tableComment.
	column := builder newClassNamed: #Column comment: self columnComment.
	type := builder newClassNamed: #Type comment: self typeComment.
	checkConstraint := builder newClassNamed: #CheckConstraint comment: self checkConstraintComment.
	primaryKeyConstraint := builder newClassNamed: #PrimaryKeyConstraint comment: self primaryKeyConstraintComment.
	foreignKeyConstraint := builder newClassNamed: #ForeignKeyConstraint comment: self foreignKeyConstraintComment.
	notNullConstraint := builder newClassNamed: #NotNullConstraint comment: self nullConstraintComment.
	uniqueConstraint := builder newClassNamed: #UniqueConstraint comment: self uniqueConstraintComment.
	"Concrete behavioural entities."
	view := builder newClassNamed: #View comment: self viewComment.
	derivedTable := builder newClassNamed: #DerivedTable comment: self derivedTableComment.
	storedProcedure := builder newClassNamed: #StoredProcedure comment: self storedProcedureComment.
	triggerStoredProcedure := builder newClassNamed: #TriggerStoredProcedure comment: self triggerStoredProcedureComment.
	trigger := builder newClassNamed: #Trigger comment: self triggerComment.
	selectQuery := builder newClassNamed: #SelectQuery comment: self selectQueryComment.
	insertQuery := builder newClassNamed: #InsertQuery comment: self insertQueryComment.
	updateQuery := builder newClassNamed: #UpdateQuery comment: self updateQueryComment.
	deleteQuery := builder newClassNamed: #DeleteQuery comment: self deleteQueryComment.
	parameter := builder newClassNamed: #Parameter comment: self parameterComment.
	localVariable := builder newClassNamed: #LocalVariable comment: self localVariableComment.
	cursor := builder newClassNamed: #Cursor comment: 'I am a cursor, a local iterator that can have parameters'.
	cursorParameter := builder newClassNamed: #CursorParameter comment: 'I am a cursor parameter'.
	alias := builder newClassNamed: #Alias comment: 'I am an Alias'.
	"Concrete reference entities."
	tableReference := builder newClassNamed: #TableReference comment: self tableReferenceComment.
	viewReference := builder newClassNamed: #ViewReference comment: self viewReferenceComment.
	derivedTableReference := builder newClassNamed: #DerivedTableReference comment: self derivedTableReferenceComment.
	parameterAccess := builder newClassNamed: #ParameterAccess comment: self parameterAccessComment.
	cursorParameterAccess := builder newClassNamed: #CursorParameterAccess comment: self cursorParameterAccessComment.
	columnReference := builder newClassNamed: #ColumnReference comment: self columnReferenceComment.
	typeReference := builder newClassNamed: #TypeReference comment: self typeReferenceComment.
	cursorReference := builder newClassNamed: #CursorReference comment: self cursorReferenceComment.
	storedProcedureCall := builder newClassNamed: #StoredProcedureCall comment: self storedProcedureCallComment.
	localVariableAccess := builder newClassNamed: #LocalVariableAccess comment: self localVariableAccessComment.
	aliasAccess := builder newClassNamed: #AliasAccess comment: self aliasAccessComment.