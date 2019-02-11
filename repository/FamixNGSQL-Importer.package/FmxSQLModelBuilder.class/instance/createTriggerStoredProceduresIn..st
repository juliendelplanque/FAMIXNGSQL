model building - entities
createTriggerStoredProceduresIn: aMooseModel
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
			"TODO: local variables" ] displayingProgress: 'Creating trigger stored procedures'