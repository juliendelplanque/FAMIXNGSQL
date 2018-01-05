initialization
defineFamixClasses

	entity := builder newClassNamed: #Entity.
	namedEntity := builder newClassNamed: #NamedEntity.
	behaviouralEntity := builder newClassNamed: #BehaviouralEntity.
	containerEntity := builder newClassNamed: #ContainerEntity.
	scopingEntity := builder newClassNamed: #ScopingEntity.
	namespace := builder newClassNamed: #Namespace.
	sourceLanguage := builder newClassNamed: #SourceLanguage.
	type := builder newClassNamed: #Type.
	
	"Properties definitions"
	namedEntity property: #name type: #String.
	
	"Relations definitions"
	namedEntity --|> entity.
	sourceLanguage --|> entity.
	behaviouralEntity --|> namedEntity.
	containerEntity --|> namedEntity.
	scopingEntity --|> containerEntity.
	type --|> containerEntity.
	namespace --|> scopingEntity.

