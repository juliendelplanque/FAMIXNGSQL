*FamixNGSQL-Importer
reachableEntities
	^ self type ifNil: [ #() ] ifNotNil: [ :aType | aType reachableEntities ]