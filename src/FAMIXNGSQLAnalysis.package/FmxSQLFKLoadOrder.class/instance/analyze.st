analyzing
analyze
	| fkDependencies |
	fkDependencies := (FmxSQLFKDependenciesAnalyzer analyze: self mooseGroup) dependencies.
	sortedTables := (MalTopologicalSorting new
							nodes: (fkDependencies collect: #key) asSet;
							edges: fkDependencies from: #key to: #value;
							run) collect: #model.
							
	