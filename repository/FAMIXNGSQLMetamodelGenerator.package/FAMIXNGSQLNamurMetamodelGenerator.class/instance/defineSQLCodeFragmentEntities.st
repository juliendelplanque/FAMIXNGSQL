definitions - SQL
defineSQLCodeFragmentEntities
	codeFragment := builder newClassNamed: #CodeFragment.
	codeFragment
		property: #beginLine type: #Integer;
		property: #endLine type: #Integer;
		property: #beginColumn type: #Integer;
		property: #endColumn type: #Integer.
	entity <|-- codeFragment.

	storedProcedureCall := builder newClassNamed: #StoredProcedure.
	codeFragment <|-- storedProcedureCall.
	
	columnAccess := builder newClassNamed: #ColumnAccess.
	codeFragment <|-- columnAccess.
	
	tableAccess := builder newClassNamed: #TableAccess.
	codeFragment <|-- tableAccess.