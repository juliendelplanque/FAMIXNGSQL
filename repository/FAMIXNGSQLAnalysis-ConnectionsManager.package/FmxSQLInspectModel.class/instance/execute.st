execute
execute
	UIManager default showWaitCursorWhile: [ 
		self connectionsManagerWidget selectedConnectionDescription fmxSQLModel inspect
	]