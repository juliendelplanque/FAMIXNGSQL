model building - entities
createNamespacesIn: aMooseModel
	metadata getNamespaces do: [ :pgNamespace |
		pgToFamixEntities
			at: pgNamespace
			put: (FmxSQLNamespace new
						name: pgNamespace name;
						mooseModel: aMooseModel;
						yourself) ]