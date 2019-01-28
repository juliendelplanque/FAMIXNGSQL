model building - entities
createTriggerStoredProceduresIn: aMooseModel
	self flag: #TODO.	"Parse the body."
	metadata getTriggerFunctions
		do: [ :pgFunction | 
			| function |
			function := FmxSQLTriggerStoredProcedure new
				name: pgFunction name;
				parentNamespace: (pgToFamixEntities at: pgFunction namespace);
				returnType: (pgToFamixEntities at: pgFunction returnType);
				mooseModel: aMooseModel;
				yourself.
			pgToFamixEntities at: pgFunction put: function.
			"TODO: local variables" ]