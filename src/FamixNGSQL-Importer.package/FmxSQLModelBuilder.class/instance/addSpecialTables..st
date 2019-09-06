model building - specials
addSpecialTables: mooseModel
	| pgClass |
	pgClass := FmxSQLTable new
		name: 'pg_class';
		isStub: true;
		mooseModel: mooseModel.
	self addStubColumns: self class pgClassTableColumnsNames toTable: pgClass.