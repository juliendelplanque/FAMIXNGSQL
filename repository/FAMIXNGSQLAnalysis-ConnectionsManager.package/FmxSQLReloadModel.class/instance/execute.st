execute
execute
	"Reload"
	self connectionsManagerWidget selectedConnectionDescription
		loadFmxSQLModel.
		
	"Inspect, for this purpose, use already defined command."
	FmxSQLInspectModel new
		connectionsManagerWidget: self connectionsManagerWidget;
		execute