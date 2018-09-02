*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLStoredProcedure 
	| call |
	call := FmxSQLStoredProcedureCall new
		storedProcedure: self;
		yourself.
	aFmxSQLStoredProcedure references add: call.
	^ call