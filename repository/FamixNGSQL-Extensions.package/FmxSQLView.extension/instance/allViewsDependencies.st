*FamixNGSQL-Extensions
allViewsDependencies
	"Returns the views that I depend on directly and indirectly."
	^ (self anyIterator: #viewsDependencies) allButFirst