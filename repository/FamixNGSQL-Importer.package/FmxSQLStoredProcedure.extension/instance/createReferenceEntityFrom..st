*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLStoredProcedure 
	^ FmxSQLStoredProcedureCall new
		candidates: { self };
		sender: aFmxSQLStoredProcedure
		yourself