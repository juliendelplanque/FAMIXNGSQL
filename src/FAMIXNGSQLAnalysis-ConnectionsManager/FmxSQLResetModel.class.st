"
Reset the Famix model stored by the connection.
"
Class {
	#name : #FmxSQLResetModel,
	#superclass : #DBConnectionsManagerWidgetCommand,
	#category : 'FAMIXNGSQLAnalysis-ConnectionsManager'
}

{ #category : #accessing }
FmxSQLResetModel class >> commandName [
	^ 'Reset model'
]

{ #category : #testing }
FmxSQLResetModel class >> isForSingleConnection [
	^ true
]

{ #category : #accessing }
FmxSQLResetModel class >> menuCategory [
	^ #FamixSQL
]

{ #category : #accessing }
FmxSQLResetModel class >> weight [
	^ 910
]

{ #category : #execute }
FmxSQLResetModel >> execute [
	self connectionsManagerWidget selectedConnectionDescription resetModel
]
