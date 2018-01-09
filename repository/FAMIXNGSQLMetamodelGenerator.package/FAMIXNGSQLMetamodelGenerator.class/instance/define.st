accessing
define
	self
		defineFamixMetaModelEntities;
		defineFamixMetaModelEntitiesRelations;
		defineFamixMetaModelEntitiesProperties.
	
	self
		defineSQLMetaModelEntities;
		defineSQLMetaModelInheritanceRelations;
		defineRelationsForTable;
		defineRelationsForColumn;
		defineRelationsForType;
		defineRelationsForQuery;
		defineRelationsForView;
		defineRelationsForFunction