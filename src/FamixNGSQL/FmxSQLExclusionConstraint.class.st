"
I represent a EXCLUSION constraint as defined in SQL standard.
"
Class {
	#name : #FmxSQLExclusionConstraint,
	#superclass : #FmxSQLConstraint,
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLExclusionConstraint class >> annotation [

	<MSEClass: #ExclusionConstraint super: #FmxSQLConstraint>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLExclusionConstraint >> isExclusionConstraint [

	<generated>
	^ true
]
