accessing - constraints
foreignKeyConstraints
	^ self constraintsSatisfying: [ :c | c class = FmxSQLForeignKeyConstraint ]