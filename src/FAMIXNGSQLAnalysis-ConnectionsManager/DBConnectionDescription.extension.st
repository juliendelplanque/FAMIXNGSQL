Extension { #name : #DBConnectionDescription }

{ #category : #'*FAMIXNGSQLAnalysis-ConnectionsManager' }
DBConnectionDescription >> fmxSQLModel [
	^ self privateState at: #fmxSQLModel ifAbsent: [ self loadFmxSQLModel ]
]

{ #category : #'*FAMIXNGSQLAnalysis-ConnectionsManager' }
DBConnectionDescription >> loadFmxSQLModel [
	| builder model |
	builder := FmxSQLModelBuilder new
				connection: self;
				databaseName: self databaseName;
				yourself.
				
	model := builder buildModel.
	^ self privateState at: #fmxSQLModel put: model
]

{ #category : #'*FAMIXNGSQLAnalysis-ConnectionsManager' }
DBConnectionDescription >> resetModel [
	self privateState removeKey: #fmxSQLModel ifAbsent: [ "Do nothing on purpose." ]
]
