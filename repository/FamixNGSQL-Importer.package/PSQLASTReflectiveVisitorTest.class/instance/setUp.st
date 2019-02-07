running
setUp
	super setUp.
	model := MooseModel new
					metamodel: FmxSQLMetamodelGenerator metamodel;
					yourself.
	function := FmxSQLStoredProcedure new.
	function mooseModel: model.
	function name: 'currentFunction'.
	
	view := FmxSQLView new
				mooseModel: model;
				name: 'currentView';
				yourself.
				
	triggerFunction := FmxSQLTriggerStoredProcedure new
								mooseModel: model;
								name: 'currentTriggerStoredProcedure';
								yourself