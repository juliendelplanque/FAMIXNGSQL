accessing
currentEntity: anEntity
	^ self solver pushScope: (PSQLEntityScope currentEntity: anEntity)