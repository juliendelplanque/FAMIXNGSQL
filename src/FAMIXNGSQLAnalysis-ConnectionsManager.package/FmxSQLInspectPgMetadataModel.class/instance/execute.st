execute
execute
	| connection |
	connection := self connectionsManagerWidget selectedConnectionDescription.
	(FmxSQLModelBuilder new
		connection: connection;
		databaseName: connection databaseName;
		loadMetaData) inspect