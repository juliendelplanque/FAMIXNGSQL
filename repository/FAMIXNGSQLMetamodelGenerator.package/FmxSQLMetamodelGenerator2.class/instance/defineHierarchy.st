definition
defineHierarchy
	super defineHierarchy.
	self
		defineSQLMetaModelInheritanceRelations;
		defineReferenceHierarchy;
		defineClausesHierarchy