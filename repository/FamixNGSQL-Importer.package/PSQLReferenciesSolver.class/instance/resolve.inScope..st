accessing
resolve: aChainOfIdentifiers inScope: aScope
	^ self
		reachableEntitiesFor: aScope
		detect: [ :entity | entity name = aChainOfIdentifiers identifier ]
		ifFound: [ :entity | 
			aChainOfIdentifiers entity: entity value.
			aChainOfIdentifiers isLast
				ifTrue: [ ^ aChainOfIdentifiers ]
				ifFalse: [ [ (self resolve: aChainOfIdentifiers next inScope: entity) ]
						on: NotFound
						do: [ PSQLReferenciesInconsistencies signalIdentifiers: aChainOfIdentifiers ] ] ]