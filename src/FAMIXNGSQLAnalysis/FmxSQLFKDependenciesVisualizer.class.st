"
I allow to visualize FK dependencies using Mondrian and the sugiyama layout.
"
Class {
	#name : #FmxSQLFKDependenciesVisualizer,
	#superclass : #FmxSQLVisualizer,
	#category : #FAMIXNGSQLAnalysis
}

{ #category : #interacting }
FmxSQLFKDependenciesVisualizer >> buildInteractions: aView forDependencies: aCollectionOfDependencies [
	"aView interaction
		noInteractions."
	aView interaction
		highlightNeighbors: [ :table | 
			((Array with: table) , (aCollectionOfDependencies select: [ :dep | dep key = table and: [ dep value isNotNil ] ] thenCollect: #value)) ]
		color: Color green.
		
	aView interaction showEdge
		shape: (RTArrowedLine new
					color: Color green);
               connectToAll: [ :table | aCollectionOfDependencies select: [ :dep | dep key = table and: [ dep value isNotNil ] ] thenCollect: #value ].
]

{ #category : #visualizing }
FmxSQLFKDependenciesVisualizer >> buildVisualizationOnView: view [
	| dependencies lb circuits |
	dependencies := (FmxSQLFKDependenciesAnalyzer analyze: self mooseGroup) dependencies.
	circuits := MalCyclesCoverage new
					nodes: (dependencies collect: #key) asSet;
					edges: dependencies from: #key to: #value;
					run;
					circuits.
	
	self buildInteractions: view forDependencies: dependencies.
	view shape rectangle
		size: 10;
		color: [ :e | 
			(dependencies anySatisfy: [ :any | any key = e and: [ any value = e ] ])
				ifTrue:[ Color red ]
				ifFalse: [ self color ] ].
	view nodes: (dependencies collect: #key) asSet.
	view shape line
		color: [ :e | 
			(circuits anySatisfy: [ :any | 
				((any includes: e key) and: [ any includes: e value ]) ])
					ifTrue: [ Color red ]
					ifFalse: [ Color gray ] ].
	view edges useAssociations: dependencies.
	view layout sugiyama
		verticalGap: 50.
	
	view build.
	
	lb := RTLegendBuilder new.
	lb view: view view.
	
	lb
		addText: 'A table of a given layer has a FK referencing a column of a table of the layer under it.';
		addText: 'Red elements are table having a FK referencing their own PK. Red lines represent FK references included in a cycle.'.
	self legendBlock value: lb.
	lb build
]
