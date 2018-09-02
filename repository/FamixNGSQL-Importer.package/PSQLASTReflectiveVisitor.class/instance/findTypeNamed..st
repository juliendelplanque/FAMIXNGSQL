finding
findTypeNamed: aName
	^ [ self findTableOrViewNamed: aName ]
		on: NotFound
		do: [ (self model allWithType: FmxSQLType)
				detect: [ :aType | aType name = aName ]
				ifNone: [ (self createEntity: FmxSQLType) name: aName ] ]