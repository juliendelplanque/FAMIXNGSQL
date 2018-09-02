accessing
reachableEntities
	^ self hasAliases
		ifTrue: [ self aliases , self reachableEntitiesOwned ]
		ifFalse: [ self reachableEntitiesOwned ]