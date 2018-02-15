model building - entities
createTypesIn: aMooseModel
	metadata getDatatypes do: [ :pgDataType |
		FmxSQLType new
			name: pgDataType name;
			mooseModel: aMooseModel ]