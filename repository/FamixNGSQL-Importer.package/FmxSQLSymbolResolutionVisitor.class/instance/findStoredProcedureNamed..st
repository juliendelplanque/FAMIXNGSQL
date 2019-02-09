convenient
findStoredProcedureNamed: anIdentifier
	"The next conditional branching is needed because of PostgreSQL treatement of identifiers.
	 If you define an identifier between "", it is case-sensitive, else it is not."
	anIdentifier indexOfFirstUppercaseCharacter > 0
		ifTrue: [ ^ (self model allWithType: FmxSQLStoredProcedure) detect: [ :aFunction | aFunction name = anIdentifier ] ]
		ifFalse: [ ^ (self model allWithType: FmxSQLStoredProcedure) detect: [ :aFunction | aFunction name asLowercase = anIdentifier ] ]