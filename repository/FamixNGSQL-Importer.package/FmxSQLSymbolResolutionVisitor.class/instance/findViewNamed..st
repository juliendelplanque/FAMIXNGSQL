finding
findViewNamed: anIdentifier
	^ (self model allWithType: FmxSQLView) detect: [ :table | table name = anIdentifier ]