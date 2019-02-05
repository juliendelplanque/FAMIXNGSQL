resolution
resolveSilently: identifiers
	self errorReport
		catch: SRReferencesInconsistencies , SRReferencesNotFound
		during: [ self resolve: identifiers ]