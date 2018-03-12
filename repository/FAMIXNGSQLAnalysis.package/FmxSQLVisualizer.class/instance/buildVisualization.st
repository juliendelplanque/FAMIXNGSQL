visualizing
buildVisualization
	"Creates a visualization and returns it. Must be overrided by subclasses."
	| view |
	view := RTMondrian new.
	
	self buildVisualizationOnView: view.
	
	^ view