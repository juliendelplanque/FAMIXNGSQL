*FAMIXNGSQLAnalysis-ConnectionsManager
fmxSQLModel
	^ self privateState at: #fmxSQLModel ifAbsent: [ self loadFmxSQLModel ]