accessing - constraints
uniqueConstraints
	^ self constraintsSatisfying: [ :c | c class = FmxSQLUniqueConstraint ]