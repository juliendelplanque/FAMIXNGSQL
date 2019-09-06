model building - entities
createConstraintsIn: aMooseModel
	metadata getConstraints
		do: [ :o | o asFmxSQLEntityIn: aMooseModel withMappingdict: pgToFamixEntities ]
		displayingProgress: 'Creating constraints'