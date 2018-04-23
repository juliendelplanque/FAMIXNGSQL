analyzing
analyze
	| candidates |
	candidates := (self mooseGroup allWithType: FmxSQLTable) select: [ :t |
		t constraints
			detect: [ :c | c class = FmxSQLPrimaryKeyConstraint ]
			ifFound: [ :pkConstraint |
				((t columns \ pkConstraint columns) reject: [ :col | col constraints anySatisfy: [ :c | c class = FmxSQLForeignKeyConstraint ] ])
					allSatisfy: [ :notPkColumn | notPkColumn constraints anySatisfy: [ :c | c class = FmxSQLUniqueConstraint ] ] ]
			ifNone: [ false ] ].
	nomenclatureTables := candidates