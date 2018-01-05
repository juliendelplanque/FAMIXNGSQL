definitions - FAMIX
defineFamixMetaModelEntities
	"Define basic entities that will be used by the SQL meta-model."
	entity := builder newClassNamed: #Entity.
	namedEntity := builder newClassNamed: #NamedEntity.
	behaviouralEntity := builder newClassNamed: #BehaviouralEntity.
	containerEntity := builder newClassNamed: #ContainerEntity.
	scopingEntity := builder newClassNamed: #ScopingEntity.
	namespace := builder newClassNamed: #Namespace.
	sourceLanguage := builder newClassNamed: #SourceLanguage.
	type := builder newClassNamed: #Type.