*FamixNGSQL-Importer
reachableEntities
	"The Select clause can be used in a Using clause with an alias so all its columns will be reachable"

	^ super reachableEntities
		,
			((self accesses , self outgoingColumnReferences , self outgoingInvocations , self outgoingTableReferences , self outgoingViewReferences , self accesses )
				collect: [ :aReference | aReference to ]
				thenSelect: [ :referenced | referenced class = FmxSQLColumn ])