definitions - FAMIX
defineFamixMetaModelEntitiesRelations
	"Inheritance relations definitions."
	entity <|-- namedEntity.
	entity <|-- sourceAnchor.
	namedEntity <|-- sourcedEntity.
	sourcedEntity <|-- behaviouralEntity.
	sourcedEntity <|-- leafEntity