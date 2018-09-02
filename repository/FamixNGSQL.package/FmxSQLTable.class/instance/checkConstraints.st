accessing - constraints
checkConstraints
	^ self constraintsSatisfying: [ :c | c class = FmxSQLCheckConstraint ]