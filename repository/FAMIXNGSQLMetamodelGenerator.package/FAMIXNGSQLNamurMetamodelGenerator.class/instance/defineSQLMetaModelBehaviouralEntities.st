definitions - SQL
defineSQLMetaModelBehaviouralEntities
	behaviouralEntity := builder newClassNamed: #BehaviouralEntity.
	namedEntity <|-- behaviouralEntity.
	
	behaviouralEntityWithSourceCode := builder newClassNamed: #BehaviouralEntityWithSourceCode.
	behaviouralEntity <|-- behaviouralEntityWithSourceCode.
	
	storedProcedure := builder newClassNamed: #StoredProcedure.
	behaviouralEntityWithSourceCode <|-- storedProcedure.
	
	"To be continued..."