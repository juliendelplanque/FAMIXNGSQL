"
Inspect the PgMetadata model.
"
Class {
	#name : #FmxSQLInspectPgMetadataModel,
	#superclass : #DBConnectionsManagerWidgetCommand,
	#category : 'FAMIXNGSQLAnalysis-ConnectionsManager'
}

{ #category : #accessing }
FmxSQLInspectPgMetadataModel class >> commandName [
	^ 'Inspect meta-data model'
]

{ #category : #testing }
FmxSQLInspectPgMetadataModel class >> isForSingleConnection [
	^ true
]

{ #category : #accessing }
FmxSQLInspectPgMetadataModel class >> menuCategory [
	^ #FamixSQL
]

{ #category : #accessing }
FmxSQLInspectPgMetadataModel class >> weight [
	^ 1000
]

{ #category : #execute }
FmxSQLInspectPgMetadataModel >> execute [
	| connection |
	connection := self connectionsManagerWidget selectedConnectionDescription.
	(FmxSQLModelBuilder new
		connection: connection;
		databaseName: connection databaseName;
		loadMetaData) inspect
]
