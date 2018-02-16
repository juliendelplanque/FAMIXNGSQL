analyzing
analyze
	| fkDependencies |
	fkDependencies := (FmxSQLFKDependenciesAnalyzer analyze: self mooseGroup) dependencies.
	sortedTables := (MalTopologicalSorting new
							nodes: (fkDependencies collect: #head) asSet;
							edges: fkDependencies from: #head to: #tail;
							run) collect: #model.
							
	