*FAMIXNGSQLAnalysis-ConnectionsManager
loadFmxSQLModel
	| builder model |
	builder := FmxSQLModelBuilder new
				connection: self;
				databaseName: self databaseName;
				yourself.
				
	model := builder buildModel.
	^ self privateState at: #fmxSQLModel put: model