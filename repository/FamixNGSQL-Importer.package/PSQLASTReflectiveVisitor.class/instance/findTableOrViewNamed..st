finding
findTableOrViewNamed: aString
	^ [ self findTableNamed: aString ]
		on: NotFound
		do: [ self findViewNamed: aString ]