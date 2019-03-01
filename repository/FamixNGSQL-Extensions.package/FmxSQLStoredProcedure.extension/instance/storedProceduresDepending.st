*FamixNGSQL-Extensions
storedProceduresDepending
	"Returns the views that depends on myself directly (reference myself directly)."
	^ ((self queryLocalIncoming: FmxSQLStoredProcedureCall) collect: [ :ref | ref from sourcedBelonger ] thenSelect: [ :sourcedBelonger | sourcedBelonger isNotNil and: [ sourcedBelonger isStoredProcedure ] ]) asSet