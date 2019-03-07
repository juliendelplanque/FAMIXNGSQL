*FamixNGSQL-Extensions
allViewsDepending
	"Returns the views that I depend on directly and indirectly."
	^ (self anyIterator: #viewsDepending) allButFirst