"
Reset each Famix model of each connection. 
"
Class {
	#name : #FmxSQLResetAllModels,
	#superclass : #DBConnectionsManagerWidgetCommand,
	#category : 'FAMIXNGSQLAnalysis-ConnectionsManager'
}

{ #category : #accessing }
FmxSQLResetAllModels class >> commandName [
	^ 'Reset all models'
]

{ #category : #testing }
FmxSQLResetAllModels class >> isForAllConnections [
	^ true
]

{ #category : #accessing }
FmxSQLResetAllModels class >> menuCategory [
	^ #FamixSQL
]

{ #category : #accessing }
FmxSQLResetAllModels class >> weight [
	^ 10
]

{ #category : #execute }
FmxSQLResetAllModels >> execute [
	self connectionsManager connections do: [ :connection |
		connection resetModel ].
	
	UIManager default inform: 'All models have been reset.'
]
