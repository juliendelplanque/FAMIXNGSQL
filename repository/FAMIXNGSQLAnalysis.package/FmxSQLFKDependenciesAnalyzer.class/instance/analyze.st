analyzing
analyze
	dependencies := (self mooseModel allWithType: FmxSQLTable)
							inject: OrderedCollection new
							into: [ :collection :table |
								|fks|
								fks := table constraints select: [ :c | c class = FmxSQLForeignKeyConstraint ].
								fks do: [ :fk |
									(fk referencedColumns collect: #columnsContainer) asSet do: [ :tableDependence |
										collection add: table -> tableDependence ] ].
								collection ]