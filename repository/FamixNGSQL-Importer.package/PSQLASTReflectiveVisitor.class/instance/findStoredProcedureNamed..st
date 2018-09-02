convenient
findStoredProcedureNamed: anIdentifier
	anIdentifier indexOfFirstUppercaseCharacter > 0
		ifTrue: [ ^ (self model allWithType: FmxSQLStoredProcedure) detect: [ :aFunction | aFunction name = anIdentifier ] ]
		ifFalse: [ ^ (self model allWithType: FmxSQLStoredProcedure) detect: [ :aFunction | aFunction name asLowercase = anIdentifier ] ]