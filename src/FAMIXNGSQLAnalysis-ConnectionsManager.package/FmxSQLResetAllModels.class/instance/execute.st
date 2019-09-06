execute
execute
	self connectionsManager connections do: [ :connection |
		connection resetModel ].
	
	UIManager default inform: 'All models have been reset.'