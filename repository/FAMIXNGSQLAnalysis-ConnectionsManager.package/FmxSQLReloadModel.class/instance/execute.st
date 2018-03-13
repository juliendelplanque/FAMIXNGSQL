execute
execute
	self connectionsManagerWidget selectedConnectionDescription
		loadFmxSQLModel.
		
	UIManager inform: 'Model reloaded.'