analyzing
analyze
	| dependencies |
	dependencies := (FmxSQLFKDependenciesAnalyzer analyze: self mooseGroup) dependencies.
	circuits := MalCyclesCoverage new
					nodes: (dependencies collect: #key) asSet;
					edges: dependencies from: #key to: #value;
					run;
					circuits.