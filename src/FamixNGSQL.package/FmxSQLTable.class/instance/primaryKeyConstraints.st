accessing
primaryKeyConstraints
	^ self constraintsSatisfying: [ :c | c class = FmxSQLPrimaryKeyConstraint ]