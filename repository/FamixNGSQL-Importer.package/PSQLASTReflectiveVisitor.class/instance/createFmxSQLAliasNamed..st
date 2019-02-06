as yet unclassified
createFmxSQLAliasNamed: anAlias
	^ (self createEntity: FmxSQLAlias)
		parentBehaviouralEntity: self currentEntity;
		name: anAlias;
		mooseModel: model;
		yourself.