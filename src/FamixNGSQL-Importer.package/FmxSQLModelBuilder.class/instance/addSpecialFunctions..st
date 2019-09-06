model building - specials
addSpecialFunctions: mooseModel
	FmxSQLStoredProcedure new
		name: 'exists';
		isStub: true;
		mooseModel: mooseModel.
		
	FmxSQLStoredProcedure new
		name: 'now';
		isStub: true;
		mooseModel: mooseModel