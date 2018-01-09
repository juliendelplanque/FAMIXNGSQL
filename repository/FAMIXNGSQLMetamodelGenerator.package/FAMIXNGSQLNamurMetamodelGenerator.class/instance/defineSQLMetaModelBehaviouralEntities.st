definitions - SQL
defineSQLMetaModelBehaviouralEntities
	behaviouralEntity := builder newClassNamed: #BehaviouralEntity.
	namedEntity <|-- behaviouralEntity.
	
	behaviouralEntityWithSourceCode := builder newClassNamed: #BehaviouralEntityWithSourceCode.
	behaviouralEntity <|-- behaviouralEntityWithSourceCode.
	
	constraint := builder newClassNamed: #Constraint.
	behaviouralEntityWithSourceCode <|-- constraint.
	
	storedProcedure := builder newClassNamed: #StoredProcedure.
	behaviouralEntityWithSourceCode <|-- storedProcedure.
	
	query := builder newClassNamed: #Query.
	behaviouralEntityWithSourceCode <|-- query.
	
	crudQuery := builder newClassNamed: #CRUDQuery.
	query <|-- crudQuery.
	
	selectQuery := builder newClassNamed: #SelectQuery.
	crudQuery <|-- selectQuery.
	
	insertQuery := builder newClassNamed: #InsertQuery.
	crudQuery <|-- insertQuery.
	
	deleteQuery := builder newClassNamed: #DeleteQuery.
	crudQuery <|-- deleteQuery.
	
	updateQuery := builder newClassNamed: #UpdateQuery.
	crudQuery <|-- updateQuery.
	
	view := builder newClassNamed: #View.
	behaviouralEntityWithSourceCode <|-- view.