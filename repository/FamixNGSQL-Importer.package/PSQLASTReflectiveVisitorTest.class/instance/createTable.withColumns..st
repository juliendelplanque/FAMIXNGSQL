helpers
createTable: aTableName withColumns: aCollectionOfColumnNames
	| table |
	table := self createTable: aTableName.
	aCollectionOfColumnNames do: [ :aColumnName | self createColumn: aColumnName inTable: table ].
	^ table