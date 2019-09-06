accessing
notNullConstraints
	^ self constraintsSatisfying: [ :c | c class = FmxSQLNotNullConstraint ]