model building - entities
createConstraintsIn: aMooseModel
	metadata getConstraints
		do: [ :o |
			o class = SqlTriggerConstraint ifFalse: [ o asFmxSQLEntityIn: aMooseModel withMappingdict: pgToFamixEntities ] ]
		displayingProgress: 'Creating constraints'