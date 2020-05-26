Class {
	#name : #FmxSQLAssociation,
	#superclass : #FmxSQLSourcedEntity,
	#traits : 'FamixTAssociation + TAssociationMetaLevelDependency',
	#classTraits : 'FamixTAssociation classTrait + TAssociationMetaLevelDependency classTrait',
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLAssociation class >> annotation [

	<MSEClass: #Association super: #FmxSQLSourcedEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]
