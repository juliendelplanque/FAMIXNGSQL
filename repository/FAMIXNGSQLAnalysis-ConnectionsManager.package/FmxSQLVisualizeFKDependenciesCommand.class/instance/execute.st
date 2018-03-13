execute
execute
	| connection builder m |
	connection := self connectionsManagerWidget selectedConnectionDescription.
	builder := FmxSQLModelBuilder new
		connection: connection;
		databaseName: connection name;
		yourself.
	m := builder buildModel.
	(FmxSQLFKDependenciesVisualizer new
		mooseGroup: m;
		buildVisualization) inspect