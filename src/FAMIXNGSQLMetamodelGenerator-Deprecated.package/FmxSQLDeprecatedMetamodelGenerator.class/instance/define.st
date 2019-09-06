definition
define
	self
		defineFamixMetaModelEntities;
		defineFamixMetaModelEntitiesRelations;
		defineFamixMetaModelEntitiesProperties.
	
	self
		defineSQLMetaModelEntities;
		defineClausesEntities;
		defineSQLMetaModelInheritanceRelations;
		defineSQLStructuralEntitiesRelations;
		defineSQLBehaviouralEntitiesRelations;
		defineSQLBehaviouralEntitiesProperties;
		defineSQLReferenceEntitiesRelations