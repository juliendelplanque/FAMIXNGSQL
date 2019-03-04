*FamixNGSQL-Extensions
allStoredProceduresDependencies
	"Returns the stored procedures that I depend on directly and indirectly."
	^ (TQBreadthFirstIterator root: self childrenBlock: #storedProceduresDependencies) allButFirst