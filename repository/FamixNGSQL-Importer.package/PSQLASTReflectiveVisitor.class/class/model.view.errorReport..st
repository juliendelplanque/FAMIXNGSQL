instance creation
model: aMooseModel view: aFmxSQLView errorReport: aPSQParsingReport
	^ (self model: aMooseModel function: aFmxSQLView)
		errorReport: aPSQParsingReport;
		yourself