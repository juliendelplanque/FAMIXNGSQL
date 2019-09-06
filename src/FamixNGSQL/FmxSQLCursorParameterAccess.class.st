"
I am an access to a cursor parameter.
"
Class {
	#name : #FmxSQLCursorParameterAccess,
	#superclass : #FmxSQLReference,
	#traits : 'FamixTAccess',
	#classTraits : 'FamixTAccess classTrait',
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLCursorParameterAccess class >> annotation [

	<MSEClass: #CursorParameterAccess super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
	^self
]
