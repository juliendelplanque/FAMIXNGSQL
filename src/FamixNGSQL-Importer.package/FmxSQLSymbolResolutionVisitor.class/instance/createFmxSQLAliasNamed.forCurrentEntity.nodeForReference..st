entity creation
createFmxSQLAliasNamed: aString forCurrentEntity: aFmxSQLEntity nodeForReference: aPSQLASTNode
	| alias |
	alias := (self createEntity: aFmxSQLEntity aliasClass)
		parentBehaviouralEntity: self currentEntity;
		name: aString;
		mooseModel: model;
		yourself.
	self
		useCurrentEntity: alias
		during: [ self createReferenceTo: aFmxSQLEntity from: aPSQLASTNode ].
	^ alias