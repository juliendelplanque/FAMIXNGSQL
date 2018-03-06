definitions - FAMIX
defineFamixMetaModelEntitiesProperties
	tNamedEntity
		property: #name type: #String.
		
	(sourcedEntity as: #TSourcedEntity)
		property: #sourceCode type: #String.
		
	(sourceAnchor as: #TSourceAnchor)
		property: #lineBegin type: #Number;
		property: #lineEnd type: #Number;
		property: #columnBegin type: #Number;
		property: #columnEnd type: #Number