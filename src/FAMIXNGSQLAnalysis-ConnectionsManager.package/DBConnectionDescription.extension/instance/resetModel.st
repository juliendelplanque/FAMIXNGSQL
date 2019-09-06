*FAMIXNGSQLAnalysis-ConnectionsManager
resetModel
	self privateState removeKey: #fmxSQLModel ifAbsent: [ "Do nothing on purpose." ]