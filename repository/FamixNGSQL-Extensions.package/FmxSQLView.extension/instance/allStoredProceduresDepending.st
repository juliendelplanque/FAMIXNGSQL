*FamixNGSQL-Extensions
allStoredProceduresDepending
	"Returns the stored procedures that I depend on directly and indirectly."
	^ (TQBreadthFirstIterator root: self childrenBlock: #storedProceduresDepending) allButFirst