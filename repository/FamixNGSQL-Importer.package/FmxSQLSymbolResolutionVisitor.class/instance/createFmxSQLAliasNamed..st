entity creation
createFmxSQLAliasNamed: anAlias
	^ (self createEntity: FmxSQLColumnAlias)
		parentBehaviouralEntity: self currentEntity;
		name: anAlias;
		mooseModel: model;
		yourself.