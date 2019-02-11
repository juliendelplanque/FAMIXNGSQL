model building - entities
createTypesIn: aMooseModel
	metadata getDatatypes do: [ :pgDataType | 
		pgToFamixEntities
			at: pgDataType
			put: (FmxSQLType new
					name: pgDataType name;
					mooseModel: aMooseModel;
					yourself) ] displayingProgress: 'Creating types'