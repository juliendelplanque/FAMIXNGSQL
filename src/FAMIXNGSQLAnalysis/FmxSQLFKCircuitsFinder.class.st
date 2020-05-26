"
I find all the circuits formed by FK references between tables.
"
Class {
	#name : #FmxSQLFKCircuitsFinder,
	#superclass : #FmxSQLAnalyzer,
	#instVars : [
		'circuits'
	],
	#category : #FAMIXNGSQLAnalysis
}

{ #category : #analyzing }
FmxSQLFKCircuitsFinder >> analyze [
	| dependencies |
	dependencies := (FmxSQLFKDependenciesAnalyzer analyze: self mooseGroup) dependencies.
	circuits := MalCyclesCoverage new
					nodes: (dependencies collect: #key) asSet;
					edges: dependencies from: #key to: #value;
					run;
					circuits.
]

{ #category : #accessing }
FmxSQLFKCircuitsFinder >> circuits [
	^ circuits
]

{ #category : #accessing }
FmxSQLFKCircuitsFinder >> circuits: anObject [
	circuits := anObject
]
