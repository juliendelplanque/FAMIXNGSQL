*FamixNGSQL-Extensions
notNullConstraints
	^ self constraintsSatisfying: [ :c | c class = FmxSQLNotNullConstraint ]