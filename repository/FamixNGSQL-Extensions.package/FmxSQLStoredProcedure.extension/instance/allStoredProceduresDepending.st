*FamixNGSQL-Extensions
allStoredProceduresDepending
	"Returns the stored procedures that I depend on directly and indirectly."
	^ (self anyIterator: #storedProceduresDepending) allButFirst