visualizing
buildVisualization
	| dependencies view lb |
	dependencies := self analyzer analyze; dependencies.
	view := RTMondrian new.
	view shape rectangle
		size: 10;
		color: self color.
	view nodes: (dependencies collect: #head) asSet.
	view edges useAssociations: dependencies.
	view layout sugiyama.
	view build.
	
	lb := RTLegendBuilder new.
	lb view: view view.
	
	lb addText: 'A table of a given layer has a FK referencing a column of a table of the layer under it.'.
	self legendBlock value: lb.
	lb build.
	
	^ view