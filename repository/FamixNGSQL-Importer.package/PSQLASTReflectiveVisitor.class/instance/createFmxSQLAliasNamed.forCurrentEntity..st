as yet unclassified
createFmxSQLAliasNamed: aString forCurrentEntity: aFmxSQLEntity
	| alias |
	alias := (self createEntity: aFmxSQLEntity aliasClass)
		parentBehaviouralEntity: self currentEntity;
		name: aString;
		mooseModel: model;
		yourself.
	self
		useCurrentEntity: alias
		during: [ self createReferenceTo: aFmxSQLEntity ].
	^ alias