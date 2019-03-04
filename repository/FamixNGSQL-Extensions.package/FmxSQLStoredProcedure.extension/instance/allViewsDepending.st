*FamixNGSQL-Extensions
allViewsDepending
	"Returns the views that I depend on directly and indirectly."
	^ (TQBreadthFirstIterator root: self childrenBlock: #viewsDepending) allButFirst