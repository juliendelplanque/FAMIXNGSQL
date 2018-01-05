definitions - FAMIX
defineFamixMetaModelEntitiesRelations
	"Inheritance relations definitions."
	namedEntity --|> entity.
	sourceLanguage --|> namedEntity.
	behaviouralEntity --|> namedEntity.
	containerEntity --|> namedEntity.
	scopingEntity --|> containerEntity.
	type --|> containerEntity.
	namespace --|> scopingEntity.