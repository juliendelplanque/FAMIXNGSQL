Class {
	#name : #FmxSQLCircularTableDependencies,
	#superclass : #FmxSQLVisualizer,
	#category : #FAMIXNGSQLAnalysis
}

{ #category : #visualizing }
FmxSQLCircularTableDependencies >> buildVisualizationOnView: view [
	| dependencies lb |
	dependencies := (FmxSQLFKDependenciesAnalyzer analyze: self mooseGroup) dependencies.
	
	view shape rectangle
		width: [ :fmxEntity | (dependencies select: [ :assoc | assoc key = fmxEntity ]) size *10 ];
		height: [ :fmxEntity | (dependencies select: [ :assoc | assoc value = fmxEntity ]) size *10 ];
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
	
	lb := RTLegendBuilder new.
	lb view: view view.
	
	lb
		addText: 'Each rectange represent a table. The width of a rectangle shows the number of FK referencing it and height the number of tables referenced.'.
	self legendBlock value: lb.
	lb build
]
