*FamixNGSQL-Extensions
selectClause
	^ self clauses detect: [ :clause | clause class = FmxSQLSelectClause ]