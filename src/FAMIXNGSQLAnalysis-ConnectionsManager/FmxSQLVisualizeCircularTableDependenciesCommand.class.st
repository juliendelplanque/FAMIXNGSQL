"
Inspect the visualisation resulting from the connection's model provided to FmxSQLCircularTableDependencies.
"
Class {
	#name : #FmxSQLVisualizeCircularTableDependenciesCommand,
	#superclass : #DBConnectionsManagerWidgetCommand,
	#category : 'FAMIXNGSQLAnalysis-ConnectionsManager'
}

{ #category : #accessing }
FmxSQLVisualizeCircularTableDependenciesCommand class >> commandName [
	^ 'Visualize Tables dependencies'
]

{ #category : #accessing }
FmxSQLVisualizeCircularTableDependenciesCommand class >> isForSingleConnection [
	^ true
]

{ #category : #accessing }
FmxSQLVisualizeCircularTableDependenciesCommand class >> menuCategory [
	^ #FamixSQL
]

{ #category : #accessing }
FmxSQLVisualizeCircularTableDependenciesCommand class >> weight [
	^ 1100
]

{ #category : #execute }
FmxSQLVisualizeCircularTableDependenciesCommand >> execute [
	(FmxSQLCircularTableDependencies new
		mooseGroup: self connectionsManagerWidget selectedConnectionDescription fmxSQLModel;
		buildVisualization) inspect
]
