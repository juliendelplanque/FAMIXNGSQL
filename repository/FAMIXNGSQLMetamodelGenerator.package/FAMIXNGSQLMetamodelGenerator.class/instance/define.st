definition
define
	self
		defineFamixMetaModelEntities;
		defineFamixMetaModelEntitiesRelations;
		defineFamixMetaModelEntitiesProperties.
	
	self
		defineSQLMetaModelEntities;
		defineSQLMetaModelInheritanceRelations;
		defineSQLStructuralEntitiesRelations;
		defineSQLBehaviouralEntitiesRelations;
		defineSQLCRUDQueriesRelations;
		defineSQLReferenceEntitiesRelations