adding
addAlias: anAlias forEntity: aCorrespondingEntity
	self aliases
		add:
			(PSQLAliasDefinition new
				alias: anAlias;
				entity: aCorrespondingEntity;
				yourself)