Class {
	#name : #FmxSQLNamedEntity,
	#superclass : #FmxSQLSourcedEntity,
	#traits : 'FamixTNamed + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTNamed classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLNamedEntity class >> annotation [

	<MSEClass: #NamedEntity super: #FmxSQLSourcedEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]
