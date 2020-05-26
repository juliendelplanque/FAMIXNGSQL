"
I am a on conflict clause
"
Class {
	#name : #FmxSQLOnConflictClause,
	#superclass : #FmxSQLClause,
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLOnConflictClause class >> annotation [

	<MSEClass: #OnConflictClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLOnConflictClause >> isOnConflictClause [

	<generated>
	^ true
]
