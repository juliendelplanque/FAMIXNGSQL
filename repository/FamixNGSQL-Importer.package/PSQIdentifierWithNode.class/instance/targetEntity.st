accessing
targetEntity
	^ self isLast
		ifFalse: [ self next targetEntity ]
		ifTrue: [ self entity ]