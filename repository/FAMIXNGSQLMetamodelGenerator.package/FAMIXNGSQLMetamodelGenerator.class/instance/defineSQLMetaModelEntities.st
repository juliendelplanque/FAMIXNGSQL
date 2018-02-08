definitions - SQL
defineSQLMetaModelEntities
	"Abstract entities."
	structuralEntity := builder newClassNamed: #StructuralEntity comment: self structuralEntityComment.
	constraint := builder newClassNamed: #Constraint comment: self constraintComment.
	columnsContainer := builder newClassNamed: #ColumnsContainer comment: self columnsContainerComment.
	queryContainer := builder newClassNamed: #QueryContainer comment: self queryContainerComment.
	crudQuery := builder newClassNamed: #CRUDQuery comment: self crudQueryComment.
	reference := builder newClassNamed: #Reference comment: self referenceComment.
	"Concrete structural entities."
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
	storedProcedure := builder newClassNamed: #StoredProcedure comment: self storedProcedureComment.
	triggerStoredProcedure := builder newClassNamed: #TriggerStoredProcedure comment: self triggerStoredProcedureComment.
	trigger := builder newClassNamed: #Trigger comment: self triggerComment.
	selectQuery := builder newClassNamed: #SelectQuery comment: self selectQueryComment.
	insertQuery := builder newClassNamed: #InsertQuery comment: self insertQueryComment.
	updateQuery := builder newClassNamed: #UpdateQuery comment: self updateQueryComment.
	deleteQuery := builder newClassNamed: #DeleteQuery comment: self deleteQueryComment.
	parameter := builder newClassNamed: #Parameter comment: self parameterComment.
	localVariable := builder newClassNamed: #LocalVariable comment: self localVariableComment.
	"Concrete reference entities."
	tableReference := builder newClassNamed: #TableReference comment: self tableReferenceComment.
	leafAccess := builder newClassNamed: #LeafAccess comment: self leafAccessComment.
	columnReference := builder newClassNamed: #ColumnReference comment: self columnReferenceComment.
	typeReference := builder newClassNamed: #TypeReference comment: self typeReferenceComment.
	storedProcedureCall := builder newClassNamed: #StoredProcedureCall comment: self storedProcedureCallComment