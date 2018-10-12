definition
define
	super define.
	self
		defineSQLMetaModelEntities;
		defineClausesEntities;
		defineSQLMetaModelInheritanceRelations;
		defineSQLStructuralEntitiesRelations;
		defineSQLBehaviouralEntitiesRelations;
		defineSQLBehaviouralEntitiesProperties;
		defineSQLReferenceEntitiesRelations