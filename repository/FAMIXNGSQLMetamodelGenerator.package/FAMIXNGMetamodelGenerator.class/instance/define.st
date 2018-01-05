accessing
define
	self
		defineFamixMetaModelEntities;
		defineFamixMetaModelEntitiesRelations;
		defineFamixMetaModelEntitiesProperties.
	
	self
		defineSQLMetaModelEntities;
		defineRelationsForTable;
		defineRelationsForColumn;
		defineRelationsForType;
		defineRelationsForQuery;
		defineRelationsForView;
		defineRelationsForFunction