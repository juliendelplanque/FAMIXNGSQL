definition
defineRelations
	super defineRelations.
	self
		defineSQLStructuralEntitiesRelations;
		defineSQLBehaviouralEntitiesRelations;
		defineSQLReferenceEntitiesRelations