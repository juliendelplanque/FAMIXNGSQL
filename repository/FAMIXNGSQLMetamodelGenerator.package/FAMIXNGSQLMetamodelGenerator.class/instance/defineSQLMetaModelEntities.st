definitions - SQL
defineSQLMetaModelEntities
	"Abstract entities."
	structuralEntity := builder newClassNamed: #StructuralEntity.
	structuralEntity
		comment: 'I am an abstract superclass for structural entities. A structural entity is an entity that defines how data are structured by the database.'.
	constraint := builder newClassNamed: #Constraint.
	constraint
		comment: 'I am an abstract superclass for constraints. A constraint restrict the possible values that can be stored in a column of a table.'.
	columnsContainer := builder newClassNamed: #ColumnsContainer.
	columnsContainer
		comment: 'I am an abstract super ckass for entities that contain columns. Two of my well-known subclasses are the table and the view.'.
	queryContainer := builder newClassNamed: #QueryContainer.
	crudQuery := builder newClassNamed: #CRUDQuery.
	reference := builder newClassNamed: #Reference.
	"Concrete structural entities."
	table := builder newClassNamed: #Table.
	column := builder newClassNamed: #Column.
	type := builder newClassNamed: #Type.
	checkConstraint := builder newClassNamed: #CheckConstraint.
	primaryKeyConstraint := builder newClassNamed: #PrimaryKeyConstraint.
	foreignKeyConstraint := builder newClassNamed: #ForeignKeyConstraint.
	notNullConstraint := builder newClassNamed: #NotNullConstraint.
	uniqueConstraint := builder newClassNamed: #UniqueConstraint.
	"Concrete behavioural entities."
	view := builder newClassNamed: #View.
	storedProcedure := builder newClassNamed: #StoredProcedure.
	triggerStoredProcedure := builder newClassNamed: #TriggerStoredProcedure.
	trigger := builder newClassNamed: #Trigger.
	selectQuery := builder newClassNamed: #SelectQuery.
	insertQuery := builder newClassNamed: #InsertQuery.
	updateQuery := builder newClassNamed: #UpdateQuery.
	deleteQuery := builder newClassNamed: #DeleteQuery.
	parameter := builder newClassNamed: #Parameter.
	localVariable := builder newClassNamed: #LocalVariable.
	"Concrete reference entities."
	tableReference := builder newClassNamed: #TableReference.
	leafAccess := builder newClassNamed: #LeafAccess.
	columnReference := builder newClassNamed: #ColumnReference.
	typeReference := builder newClassNamed: #TypeReference.
	storedProcedureCall := builder newClassNamed: #StoredProcedureCall