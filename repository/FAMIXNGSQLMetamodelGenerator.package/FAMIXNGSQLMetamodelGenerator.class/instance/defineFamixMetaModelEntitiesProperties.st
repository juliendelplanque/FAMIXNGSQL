definitions - FAMIX
defineFamixMetaModelEntitiesProperties
	(namedEntity as: #TNamedEntity) trait
		property: #name type: #String.
		
	(sourcedEntity as: #TSourcedEntity) trait
		property: #sourceCode type: #String.
		
	(sourceAnchor as: #TSourceAnchor) trait
		property: #lineBegin type: #Integer;
		property: #lineEnd type: #Integer;
		property: #columnBegin type: #Integer;
		property: #columnEnd type: #Integer