model building - specials
addSpecialFunctions: mooseModel
	FmxSQLStoredProcedure new
		name: 'exists';
		isStub: true;
		mooseModel: mooseModel