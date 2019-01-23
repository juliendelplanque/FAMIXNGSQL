*FamixNGSQL-Extensions
uniqueConstraints
	^ self constraintsSatisfying: [ :c | c class = FmxSQLUniqueConstraint ]