"
Reload the model associated with the selected connection description in the connections manager and inspect it.
"
Class {
	#name : #FmxSQLReloadModel,
	#superclass : #DBConnectionsManagerWidgetCommand,
	#category : 'FAMIXNGSQLAnalysis-ConnectionsManager'
}

{ #category : #accessing }
FmxSQLReloadModel class >> commandName [
	^ 'Reload model and inspect'
]

{ #category : #testing }
FmxSQLReloadModel class >> isForSingleConnection [
	^ true
]

{ #category : #accessing }
FmxSQLReloadModel class >> menuCategory [
	^ #FamixSQL
]

{ #category : #accessing }
FmxSQLReloadModel class >> weight [
	^ 901
]

{ #category : #execute }
FmxSQLReloadModel >> execute [
	"Reload"
	self connectionsManagerWidget selectedConnectionDescription
		loadFmxSQLModel.
		
	"Inspect, for this purpose, use already defined command."
	FmxSQLInspectModel new
		connectionsManagerWidget: self connectionsManagerWidget;
		execute
]
