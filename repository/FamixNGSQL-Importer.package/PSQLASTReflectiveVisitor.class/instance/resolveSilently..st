resolution
resolveSilently: identifiers
	[ self resolve: identifiers ]
		on: SRReferencesInconsistencies , SRReferencesNotFound
		do: [ :err |  self errorReport addError: err ]