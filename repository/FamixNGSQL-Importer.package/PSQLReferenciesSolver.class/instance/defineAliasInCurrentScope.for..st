alias
defineAliasInCurrentScope: aString for: aBlockClosure
	self topScope addAlias: aString forEntity: aBlockClosure value