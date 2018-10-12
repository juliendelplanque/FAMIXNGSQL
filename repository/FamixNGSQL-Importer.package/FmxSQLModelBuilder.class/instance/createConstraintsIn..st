model building - entities
createConstraintsIn: aMooseModel
	metadata objects
		select: [ :o |
			o isSqlCheckConstraint or: [ 
				o isSqlForeignKeyConstraint or: [ 
					o isSqlPrimaryKeyConstraint or: [ 
						o isSqlUniqueConstraint ] ] ] ]
		thenDo: [ :o | o asFmxSQLEntityIn: aMooseModel withMappingdict: pgToFamixEntities ]