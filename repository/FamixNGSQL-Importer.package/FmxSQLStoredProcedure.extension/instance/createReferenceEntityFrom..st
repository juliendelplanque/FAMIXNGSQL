*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLStoredProcedure 
	^ FmxSQLStoredProcedureCall new
		storedProcedure: self;
		sender: aFmxSQLStoredProcedure
		yourself