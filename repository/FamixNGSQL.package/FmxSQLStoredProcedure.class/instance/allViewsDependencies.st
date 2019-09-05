accessing
allViewsDependencies
	"Returns the views that I depend on directly and indirectly."
	^ (self anyTreeIterator: #viewsDependencies) allButFirst