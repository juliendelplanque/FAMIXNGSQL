instance creation
model: aMooseModel function: aFmxSQLStoredProcedure errorReport: aPSQParsingReport
	^ (self model: aMooseModel function: aFmxSQLStoredProcedure)
		errorReport: aPSQParsingReport;
		yourself