accessing - constraints
primaryKeyConstraints
	^ self constraintsSatisfying: [ :c | c class = FmxSQLPrimaryKeyConstraint ]