accessing
allViewsDepending
	"Returns the views that I depend on directly and indirectly."
	^ (self anyTreeIterator: #viewsDepending) allButFirst