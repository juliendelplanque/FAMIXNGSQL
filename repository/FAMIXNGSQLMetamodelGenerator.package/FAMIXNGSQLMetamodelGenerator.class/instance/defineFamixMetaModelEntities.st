definitions - FAMIX
defineFamixMetaModelEntities
	entity := builder newClassNamed: #Entity.
	sourceAnchor := builder newClassNamed: #SourceAnchor.
	namedEntity := builder newClassNamed: #NamedEntity.
	sourcedEntity := builder newClassNamed: #SourcedEntity.
	leafEntity := builder newClassNamed: #LeafEntity.
	behaviouralEntity := builder newClassNamed: #BehaviouralEntity.
	