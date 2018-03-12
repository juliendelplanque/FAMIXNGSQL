visualizing
buildVisualizationOnView: view
	| dependencies lb circuits |
	dependencies := self analyzer analyze; dependencies.
	circuits := MalCyclesCoverage new
					nodes: (dependencies collect: #head) asSet;
					edges: dependencies from: #head to: #tail;
					run;
					circuits.
	
	self buildInteractions: view forDependencies: dependencies.
	view shape rectangle
		size: 10;
		color: self color.
	view nodes: (dependencies collect: #head) asSet.
	view shape line
		color: [ :e | 
			(circuits anySatisfy: [ :any | 
				((any includes: e head) and: [ any includes: e tail ]) ])
					ifTrue: [ Color red ]
					ifFalse: [ Color white ] ].
	view edges useAssociations: dependencies.
	view layout sugiyama
		verticalGap: 50.
	
	view build.
	
	lb := RTLegendBuilder new.
	lb view: view view.
	
	lb
		addText: 'A table of a given layer has a FK referencing a column of a table of the layer under it.';
		addText: 'Red lines represent FK references included in a cycle.'.
	self legendBlock value: lb.
	lb build