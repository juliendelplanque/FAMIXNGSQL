"
Abstract visualizer class that creates a visualization from a FmxSQLAnalyzer's results.
"
Class {
	#name : #FmxSQLVisualizer,
	#superclass : #Object,
	#instVars : [
		'mooseGroup',
		'color',
		'legendBlock'
	],
	#category : #FAMIXNGSQLAnalysis
}

{ #category : #visualizing }
FmxSQLVisualizer >> buildVisualization [
	"Creates a visualization and returns it. Must be overrided by subclasses."
	| view |
	view := RTMondrian new.
	
	self buildVisualizationOnView: view.
	
	^ view
]

{ #category : #visualizing }
FmxSQLVisualizer >> buildVisualizationOnView: view [
	"Creates a visualization on the view provided as parameter. Must be overrided by subclasses."
	self subclassResponsibility
]

{ #category : #accessing }
FmxSQLVisualizer >> color [
	^ color
]

{ #category : #accessing }
FmxSQLVisualizer >> color: anObject [
	color := anObject
]

{ #category : #initialization }
FmxSQLVisualizer >> initialize [
	super initialize.
	self
		color: Color black;
		legendBlock: [ :legendBuilder | ]
]

{ #category : #accessing }
FmxSQLVisualizer >> legendBlock [
	^ legendBlock
]

{ #category : #accessing }
FmxSQLVisualizer >> legendBlock: anObject [
	legendBlock := anObject
]

{ #category : #accessing }
FmxSQLVisualizer >> mooseGroup [
	^ mooseGroup
]

{ #category : #accessing }
FmxSQLVisualizer >> mooseGroup: anObject [
	mooseGroup := anObject
]
