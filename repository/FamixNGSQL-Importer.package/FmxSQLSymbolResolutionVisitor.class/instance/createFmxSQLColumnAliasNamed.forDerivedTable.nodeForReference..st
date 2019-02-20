entity creation
createFmxSQLColumnAliasNamed: aString forDerivedTable: aFmxSQLDerivedTable nodeForReference: aPSQLASTNode
	| alias |
	alias := (self createEntity: FmxSQLColumnAlias)
		parentBehaviouralEntity: self currentEntity;
		name: aString;
		mooseModel: model;
		yourself.
	self
		useCurrentEntity: alias
		during: [ self createReferenceTo: aFmxSQLDerivedTable from: aPSQLASTNode ].
	^ alias