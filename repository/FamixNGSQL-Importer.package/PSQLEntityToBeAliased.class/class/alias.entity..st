instance creation
alias: alias entity: anEntity
	self deprecated: 'Should not be used without #astNode set. Please use #alias:entity:astNode: instead.'.
	^ self new
		alias: alias;
		entity: anEntity;
		yourself