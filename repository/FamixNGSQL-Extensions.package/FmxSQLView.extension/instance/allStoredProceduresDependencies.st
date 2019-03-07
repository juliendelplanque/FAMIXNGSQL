*FamixNGSQL-Extensions
allStoredProceduresDependencies
	"Returns the stored procedures that I depend on directly and indirectly."
	^ (self anyIterator: #storedProceduresDependencies) allButFirst