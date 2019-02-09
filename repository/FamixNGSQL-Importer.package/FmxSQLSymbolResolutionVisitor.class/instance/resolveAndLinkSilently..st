convenient
resolveAndLinkSilently: identifiers 
	self resolveSilently: identifiers.
	self linkReferencedEntities: identifiers.
	