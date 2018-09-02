accessing
currentEntity
	^ (self scopes detect: #hasCurrentEntity) currentEntity