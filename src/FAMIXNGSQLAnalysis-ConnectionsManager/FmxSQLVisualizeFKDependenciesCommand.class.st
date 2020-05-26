"
Inspect the visualisation resulting from the connection's model provided to FmxSQLFKDependenciesVisualizer.
"
Class {
	#name : #FmxSQLVisualizeFKDependenciesCommand,
	#superclass : #DBConnectionsManagerWidgetCommand,
	#category : 'FAMIXNGSQLAnalysis-ConnectionsManager'
}

{ #category : #accessing }
FmxSQLVisualizeFKDependenciesCommand class >> commandName [
	^ 'Visualize FK dependencies'
]

{ #category : #accessing }
FmxSQLVisualizeFKDependenciesCommand class >> isForSingleConnection [
	^ true
]

{ #category : #accessing }
FmxSQLVisualizeFKDependenciesCommand class >> menuCategory [
	^ #FamixSQL
]

{ #category : #accessing }
FmxSQLVisualizeFKDependenciesCommand class >> weight [
	^ 1000
]

{ #category : #execute }
FmxSQLVisualizeFKDependenciesCommand >> execute [
	(FmxSQLFKDependenciesVisualizer new
		mooseGroup: self connectionsManagerWidget selectedConnectionDescription fmxSQLModel;
		buildVisualization) inspect
]
