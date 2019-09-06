accessing
currentEntity: anEntity
	^ self solver pushScope: (SREntityScope currentEntity: anEntity)