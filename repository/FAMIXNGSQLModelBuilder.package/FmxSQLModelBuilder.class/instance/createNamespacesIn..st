model building - entities
createNamespacesIn: aMooseModel
	metadata objects select: [ :o | o class = SqlNamespace ] thenDo: [ :pgNamespace |
		pgToFamixEntities
			at: pgNamespace
			put: (FmxSQLNamespace new
						name: pgNamespace name;
						mooseModel: aMooseModel;
						yourself) ]