definitions - SQL
defineSQLMetaModelEntities
	"Abstract entities."
	structuralEntity := builder newClassNamed: #StructuralEntity.
	constraint := builder newClassNamed: #Constraint.
	columnsContainer := builder newClassNamed: #ColumnsContainer.
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