accessing
define
	self
		"First define entities and inheritance relation."
		defineSQLMetaModelBasicEntities;
		defineSQLMetaModelStructuralEntities;
		defineSQLCodeFragmentEntities;
		defineSQLMetaModelBehaviouralEntities;
		"Then the other relations between them."
		defineSQLMetaModelStructuralRelations;
		defineSQLCodeFragmentRelations;
		defineSQLMetaModelBehaviouralRelations