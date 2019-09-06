resolution
resolveAndLink: identifiers 
	self resolve: identifiers.
	self linkReferencedEntities: identifiers.
	