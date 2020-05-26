Trait {
	#name : #FmxSQLBehaviouralEntity,
	#traits : 'FmxSQLTWithEntitySourceAnchor',
	#classTraits : 'FmxSQLTWithEntitySourceAnchor classTrait',
	#category : 'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLBehaviouralEntity classSide >> annotation [

	<MSEClass: #BehaviouralEntity super: #Trait>
	<package: #FamixNGSQL>
	<generated>
	^self
]
