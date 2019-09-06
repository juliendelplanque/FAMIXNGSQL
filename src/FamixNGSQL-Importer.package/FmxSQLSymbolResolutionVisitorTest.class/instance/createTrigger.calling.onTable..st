helpers
createTrigger: aString calling: aFmxSQLTriggerStoredProcedure onTable: aFmxSQLTable 
	^ FmxSQLTrigger new
		name: aString;
		table: aFmxSQLTable;
		storedProcedure: aFmxSQLTriggerStoredProcedure;
		yourself