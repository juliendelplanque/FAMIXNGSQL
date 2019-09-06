"
I am a Values clause
"
Class {
	#name : #FmxSQLValuesClause,
	#superclass : #FmxSQLClause,
	#traits : 'FamixTWithAccesses + FamixTWithInvocations + FmxSQLTWithColumnReference + FmxSQLTWithDerivedTableReference',
	#classTraits : 'FamixTWithAccesses classTrait + FamixTWithInvocations classTrait + FmxSQLTWithColumnReference classTrait + FmxSQLTWithDerivedTableReference classTrait',
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLValuesClause class >> annotation [

	<MSEClass: #ValuesClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
	^self
]
