helpers
createStoredProcedure: aProcedureName
	^ FmxSQLStoredProcedure new
		name: aProcedureName;
		mooseModel: model;
		yourself