model building - entities
createStoredProceduresIn: aMooseModel
	metadata getFunctions
		do: [ :pgFunction | 
			| function |
			function := FmxSQLStoredProcedure new
				name: pgFunction name;
				returnType: (pgToFamixEntities at: pgFunction returnType);
				mooseModel: aMooseModel;
				yourself.
			pgToFamixEntities at: pgFunction put: function.
			pgFunction isStub
				ifFalse: [ pgFunction ast acceptVisitor: (PSQLASTReflectiveVisitor model: aMooseModel) ]
			"pgFunction arguments
				do: [ :pgArgument | 
					FmxSQLParameter new
						name: pgArgument name;
						type: (pgToFamixEntities at: pgArgument datatype);
						storedProcedure: function;
						mooseModel: aMooseModel;
						yourself ]"	"TODO: local variables" ]