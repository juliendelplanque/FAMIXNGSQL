*FamixNGSQL-Extensions
allViewsDependencies
	"Returns the views that I depend on directly and indirectly."
	^ ((TQBreadthFirstIterator root: self childrenBlock: #viewsDependencies)
			collect: #yourself) allButFirst