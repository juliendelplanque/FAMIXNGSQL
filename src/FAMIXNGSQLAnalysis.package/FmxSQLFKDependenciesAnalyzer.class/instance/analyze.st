analyzing
analyze
	dependencies := (self mooseGroup allWithType: FmxSQLTable)
							inject: OrderedCollection new
							into: [ :collection :table |
								|fks tablesDependingOn|
								fks := table constraints select: [ :c | c class = FmxSQLForeignKeyConstraint ].
								tablesDependingOn := (fks collect: [ :fk | (fk referencedColumns collect: #columnsContainer) ]) flattened asSet.
								tablesDependingOn
									ifEmpty: [ collection add: table -> nil ]
									ifNotEmpty: [ 
										tablesDependingOn do: [ :t | collection add: table -> t ] ].
								collection ]