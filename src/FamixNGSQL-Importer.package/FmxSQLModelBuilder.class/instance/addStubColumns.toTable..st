model building - specials
addStubColumns: columnsNames toTable: aFmxSQLTable
	columnsNames do: [ :str |
		FmxSQLColumn new
			name: str;
			isStub: true;
			columnsContainer: aFmxSQLTable;
			mooseModel: aFmxSQLTable mooseModel ]