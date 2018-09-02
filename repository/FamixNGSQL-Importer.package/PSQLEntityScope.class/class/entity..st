accessing
entity: anEntity
	^ self new
		entity: anEntity;
		isCurrentEntity: false;
		yourself