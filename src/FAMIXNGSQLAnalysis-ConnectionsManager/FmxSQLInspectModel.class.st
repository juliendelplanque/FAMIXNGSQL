"
Inspect the model associated with the selected connection description in  the connections manager.
"
Class {
	#name : #FmxSQLInspectModel,
	#superclass : #DBConnectionsManagerWidgetCommand,
	#category : 'FAMIXNGSQLAnalysis-ConnectionsManager'
}

{ #category : #accessing }
FmxSQLInspectModel class >> commandName [
	^ 'Inspect model'
]

{ #category : #testing }
FmxSQLInspectModel class >> isForSingleConnection [
	^ true
]

{ #category : #accessing }
FmxSQLInspectModel class >> menuCategory [
	^ #FamixSQL
]

{ #category : #accessing }
FmxSQLInspectModel class >> weight [
	^ 900
]

{ #category : #execute }
FmxSQLInspectModel >> execute [
	UIManager default showWaitCursorWhile: [ 
		self connectionsManagerWidget selectedConnectionDescription fmxSQLModel inspect
	]
]
