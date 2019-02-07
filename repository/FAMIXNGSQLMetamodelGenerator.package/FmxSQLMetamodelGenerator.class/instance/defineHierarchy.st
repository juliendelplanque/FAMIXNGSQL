definition
defineHierarchy
	super defineHierarchy.
	"Structural part."
	self
		defineStructuralHierarchy;
		defineStructuralReferencesHierarchy.
	"Behavioural part."
	self
		defineBehaviouralHierarchy;
		defineClausesHierarchy;
		defineBehaviouralReferencesHierarchy