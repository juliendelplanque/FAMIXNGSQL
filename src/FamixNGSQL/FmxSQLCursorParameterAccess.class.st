"
I am an access to a cursor parameter.
"
Class {
	#name : #FmxSQLCursorParameterAccess,
	#superclass : #FmxSQLReference,
	#traits : 'FamixTAccess + FmxSQLTWithQualifiedReference',
	#classTraits : 'FamixTAccess classTrait + FmxSQLTWithQualifiedReference classTrait',
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLCursorParameterAccess class >> annotation [

	<MSEClass: #CursorParameterAccess super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
	^self
]
