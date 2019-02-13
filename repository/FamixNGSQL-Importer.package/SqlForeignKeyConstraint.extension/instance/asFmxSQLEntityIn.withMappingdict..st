*FamixNGSQL-Importer
asFmxSQLEntityIn: aMooseModel withMappingdict: pgToFamixEntities
	| constraint |
	constraint := FmxSQLForeignKeyConstraint new
			name: self name;
			table: (pgToFamixEntities at: self constrainedColumns anyOne) columnsContainer;
			yourself.
	self constrainedColumns
		collect: [ :pgColumn | pgToFamixEntities at: pgColumn ]
		thenDo: [ :fmxColumn |
			FmxSQLColumnReference new
				source: constraint;
				column: fmxColumn;
				mooseModel: aMooseModel ].
	self referencedObjects
		collect: [ :pgColumn | pgToFamixEntities at: pgColumn ]
		thenDo: [ :fmxColumn |
			FmxSQLColumnReference new
				foreignKeyConstraintSource: constraint;
				column: fmxColumn;
				mooseModel: aMooseModel ].
	constraint mooseModel: aMooseModel.
	^ constraint