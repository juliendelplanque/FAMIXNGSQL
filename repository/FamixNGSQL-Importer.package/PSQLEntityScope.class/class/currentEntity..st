accessing
currentEntity: anEntity
	^ self new
		entity: anEntity;
		isCurrentEntity: true;
		yourself