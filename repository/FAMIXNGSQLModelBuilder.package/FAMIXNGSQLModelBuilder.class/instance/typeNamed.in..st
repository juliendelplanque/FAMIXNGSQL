built entities retrieving
typeNamed: aString in: aMooseModel
	^ (aMooseModel allWithType: FmxSQLType) detect: [ :type |
		type name = aString ]