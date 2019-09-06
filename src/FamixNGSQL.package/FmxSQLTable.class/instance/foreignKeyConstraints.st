accessing
foreignKeyConstraints
	^ self constraintsSatisfying: [ :c | c class = FmxSQLForeignKeyConstraint ]