definition - structural
defineStructuralTraitsRelations
	"A columns container contains columns."
	(tColumnsContainer property: #columns)
		<>-* (tColumn property: #columnsContainer).
	(tWithColumnReference property: #outgoingColumnReferences)
		-* (columnReference property: #source) source.
	(tWithTableReference property: #outgoingTableReferences)
		-* (tableReference property: #source) source