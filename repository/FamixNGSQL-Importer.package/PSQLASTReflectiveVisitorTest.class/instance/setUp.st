running
setUp
	model := MooseModel new.
	function := FmxSQLStoredProcedure new.
	function mooseModel: model.
	function name: 'currentFunction'