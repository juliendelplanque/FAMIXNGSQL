*FamixNGSQL-Extensions
checkConstraints
	^ self constraintsSatisfying: [ :c | c class = FmxSQLCheckConstraint ]