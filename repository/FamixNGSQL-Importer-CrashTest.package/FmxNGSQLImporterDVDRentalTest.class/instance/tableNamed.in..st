as yet unclassified
tableNamed: aString in: aModel
	^ (aModel allWithType: FmxSQLTable) detect: [ :t | t name = aString ]