model building - specials
addSpecialTables: mooseModel
	FmxSQLTable new
		name: 'pg_class';
		isStub: true;
		mooseModel: mooseModel.