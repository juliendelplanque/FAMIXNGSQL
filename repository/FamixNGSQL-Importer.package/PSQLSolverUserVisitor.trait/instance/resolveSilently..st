resolution
resolveSilently: identifiers
	[ self resolve: identifiers ]
		on: PSQLReferenciesInconsistencies , PSQLReferenciesNotFound
		do: [ :err |  self errorReport addError: err ]