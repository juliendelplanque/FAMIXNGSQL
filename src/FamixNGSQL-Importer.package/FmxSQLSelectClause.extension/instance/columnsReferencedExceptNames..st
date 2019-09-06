*FamixNGSQL-Importer
columnsReferencedExceptNames: columnNames
	^ self outgoingColumnReferences
			collect: #to
			thenSelect: [ :column |
				columnNames noneSatisfy: [ :columnName | columnName = column name ] ]