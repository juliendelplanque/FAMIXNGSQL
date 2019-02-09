finding
findTableNamed: anIdentifier 
	^ (self model allWithType: FmxSQLTable) detect: [ :table | table name = anIdentifier ]  .