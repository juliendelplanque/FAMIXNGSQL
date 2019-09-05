accessing
allStoredProceduresDepending
	"Returns the stored procedures that I depend on directly and indirectly."
	^ (self anyTreeIterator: #storedProceduresDepending) allButFirst