"
Determinate the order in which the tables of the Moose model should be created in a new database in order to satisfy foreign key constraints.
"
Class {
	#name : #FmxSQLFKLoadOrder,
	#superclass : #FmxSQLAnalyzer,
	#instVars : [
		'sortedTables'
	],
	#category : #FAMIXNGSQLAnalysis
}

{ #category : #analyzing }
FmxSQLFKLoadOrder >> analyze [
	| fkDependencies |
	fkDependencies := (FmxSQLFKDependenciesAnalyzer analyze: self mooseGroup) dependencies.
	sortedTables := (MalTopologicalSorting new
							nodes: (fkDependencies collect: #key) asSet;
							edges: fkDependencies from: #key to: #value;
							run) collect: #model.
							
	
]

{ #category : #accessing }
FmxSQLFKLoadOrder >> sortedTables [
	^ sortedTables
]

{ #category : #accessing }
FmxSQLFKLoadOrder >> sortedTables: anObject [
	sortedTables := anObject
]
