accessing
checkConstraints
	^ self constraintsSatisfying: [ :c | c class = FmxSQLCheckConstraint ]