definitions - FAMIX
defineFamixMetaModelEntities
	entity := builder newClassNamed: #Entity.
	sourceAnchor := builder newClassNamed: #SourceAnchor.
	tNamedEntity := builder newTraitNamed: #NamedEntity.
	sourcedEntity := builder newClassNamed: #SourcedEntity.
	leafEntity := builder newClassNamed: #LeafEntity.
	behaviouralEntity := builder newClassNamed: #BehaviouralEntity.
	