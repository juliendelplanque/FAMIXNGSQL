visualizing
buildVisualizationOnView: view
	| dependencies |
	dependencies := (FmxSQLFKDependenciesAnalyzer analyze: self mooseGroup) dependencies.
	
	view shape rectangle
		width: [ :fmxEntity | (dependencies select: [ :assoc | assoc head = fmxEntity ]) size *10 ];
		height: [ :fmxEntity | (dependencies select: [ :assoc | assoc tail = fmxEntity ]) size *10 ];
		color: [ :fmxEntity |
			fmxEntity class = FmxSQLTable
				ifTrue: [ Color red ]
				ifFalse: [ Color blue ] ].
	view nodes: (self mooseGroup allWithType: FmxSQLTable) ", (self mooseGroup allWithType: FmxSQLView)".

	view shape line arrowedLine.
	view edges
		useAssociations: dependencies.
	
	view layout circle.
	
	view build.
	
	"lb := RTLegendBuilder new.
	lb view: view view.
	
	lb
		addText: 'A table of a given layer has a FK referencing a column of a table of the layer under it.';
		addText: 'Red elements are table having a FK referencing their own PK. Red lines represent FK references included in a cycle.'.
	self legendBlock value: lb.
	lb build"