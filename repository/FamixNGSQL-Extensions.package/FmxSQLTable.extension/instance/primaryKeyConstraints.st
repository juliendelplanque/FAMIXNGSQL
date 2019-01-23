*FamixNGSQL-Extensions
primaryKeyConstraints
	^ self constraintsSatisfying: [ :c | c class = FmxSQLPrimaryKeyConstraint ]