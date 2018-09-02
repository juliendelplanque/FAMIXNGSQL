accessing - constraints
notNullConstraints
	^ self constraintsSatisfying: [ :c | c class = FmxSQLNotNullConstraint ]