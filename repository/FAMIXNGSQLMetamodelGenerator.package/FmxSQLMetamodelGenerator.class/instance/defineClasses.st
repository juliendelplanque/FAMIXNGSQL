definition
defineClasses
	super defineClasses.
	"Structural part."
	self
		defineStructuralEntities.
	"Behavioural part."
	self
		defineBehaviouralEntities;
		defineClausesEntities;
		defineClausesHierarchy