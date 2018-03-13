execute
execute
	(FmxSQLFKDependenciesVisualizer new
		mooseGroup: self connectionsManagerWidget selectedConnectionDescription fmxSQLModel;
		buildVisualization) inspect