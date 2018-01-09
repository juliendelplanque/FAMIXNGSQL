definitions - FAMIX
defineFamixMetaModelEntitiesRelations
	"Inheritance relations definitions."
	entity <|-- namedEntity.
	namedEntity <|-- sourceLanguage.
	namedEntity <|-- behaviouralEntity.
	namedEntity <|-- containerEntity.
	containerEntity <|-- scopingEntity.
	containerEntity <|-- type.
	scopingEntity <|-- namespace.