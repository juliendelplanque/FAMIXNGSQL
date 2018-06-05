definitions - FAMIX
defineFamixMetaModelEntities
	entity := builder newClassNamed: #Entity.
	sourceAnchor := builder newClassNamed: #SourceAnchor.
	tNamedEntity := builder newTraitNamed: #NamedEntity.
	tSourcedEntity := builder newTraitNamed: #SourcedEntity.
	behaviouralEntity := builder newClassNamed: #BehaviouralEntity.
	tAbstractType := builder newTraitNamed: #AbstractType
	