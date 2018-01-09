definitions - SQL
defineSQLMetaModelStructuralEntities
	structuralEntity := builder newClassNamed: #StructuralEntity.
	namedEntity <|-- structuralEntity.

	column := builder newClassNamed: #Column.
	structuralEntity <|-- column.

	table := builder newClassNamed: #Table.
	structuralEntity <|-- table.