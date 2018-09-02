finding
findColumnNamed: aColumnName inTableOrView: aFmxSQLView 
	^ aFmxSQLView columns detect: [ :column | column name = aColumnName ]