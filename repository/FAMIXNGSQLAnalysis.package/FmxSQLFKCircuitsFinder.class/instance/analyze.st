analyzing
analyze
	| dependencies |
	dependencies := (FmxSQLFKDependenciesAnalyzer analyze: self mooseGroup) dependencies.
	circuits := MalCyclesCoverage new
					nodes: (dependencies collect: #head) asSet;
					edges: dependencies from: #head to: #tail;
					run;
					circuits.