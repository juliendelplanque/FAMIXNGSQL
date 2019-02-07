definition
defineRelations
	super defineRelations.
	"Structural part."
	self
		defineStructuralEntitiesRelations;
		defineStructuralTraitsRelations;
		defineStructuralReferenceEntities.
	"Behavioural part."
	self
		defineBehaviouralEntitiesRelations;
		defineBehaviouralTraitsRelations;
		defineBehaviouralReferenceEntities