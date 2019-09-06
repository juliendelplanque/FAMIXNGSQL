accessing
storedProceduresDependencies
	"Returns the stored procedures that I depend on directly (I call them directly)."
	^ ((self queryOutgoing: FmxSQLStoredProcedureCall) collect: [ :ref | ref to ]) asSet