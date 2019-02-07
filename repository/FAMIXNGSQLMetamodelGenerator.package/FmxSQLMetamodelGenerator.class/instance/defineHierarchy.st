definition
defineHierarchy
	super defineHierarchy.
	self
		defineStructuralHierarchy;
		defineBehaviouralHierarchy;
		defineStructuralReferencesHierarchy;
		defineBehaviouralReferencesHierarchy;
		defineClausesHierarchy