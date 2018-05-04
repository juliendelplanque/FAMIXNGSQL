convenient
addCallTargeting: aFmxSQLStoredProcedure
	FmxSQLStoredProcedureCall new
		mooseModel: self mooseModel;
		storedProcedure: aFmxSQLStoredProcedure;
		storedProcedureContainer: self