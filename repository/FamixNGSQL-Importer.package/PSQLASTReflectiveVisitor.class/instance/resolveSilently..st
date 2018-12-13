resolution
resolveSilently: identifiers
	[ self resolve: identifiers ]
		on: SRReferenciesInconsistencies , SRReferenciesNotFound
		do: [ :err |  self errorReport addError: err ]