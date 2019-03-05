*FamixNGSQL-Importer
asFmxSQLEntityIn: aMooseModel withMappingdict: pgToFamixEntities
	| constraint |
	constraint :=  FmxSQLCheckConstraint new
			name: self name;
			table: (pgToFamixEntities at: self constrainedColumns anyOne) columnsContainer;
			source: self code;
			mooseModel: aMooseModel;
			yourself.
	self constrainedColumns
		collect: [ :pgColumn | pgToFamixEntities at: pgColumn ]
		thenDo: [ :fmxColumn |
			FmxSQLColumnReference new
				source: constraint;
				column: fmxColumn;
				isWildCardReference: false;
				isCertain: true;
				mooseModel: aMooseModel ].
	^ constraint