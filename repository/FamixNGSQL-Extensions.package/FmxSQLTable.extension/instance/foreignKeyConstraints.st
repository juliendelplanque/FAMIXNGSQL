*FamixNGSQL-Extensions
foreignKeyConstraints
	^ self constraintsSatisfying: [ :c | c class = FmxSQLForeignKeyConstraint ]