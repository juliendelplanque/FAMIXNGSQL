*FamixNGSQL-Importer
reachableEntities
	"This first part gets aliased columns defined by the query."
	^ self columns , 
	"The next part gets the columns defined by the query that are not aliased."
	(self query
		ifNil: [ ^ #() ]
		ifNotNil: [ :q |
			q clauses
				detect: [ :c | c class = FmxSQLSelectClause ]
				ifFound: [ :selectClause |
					selectClause outgoingColumnReferences
						collect: #to
						thenSelect: [ :column |
							self columns noneSatisfy: [ :c | c name = column name ] ] ]
				ifNone: [ #() ] ])