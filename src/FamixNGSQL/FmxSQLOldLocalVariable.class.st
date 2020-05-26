"
I model the special OLD local variable accessible from inside trigger stored procedure.
"
Class {
	#name : #FmxSQLOldLocalVariable,
	#superclass : #FmxSQLLocalVariable,
	#traits : 'FmxSQLColumnsContainer',
	#classTraits : 'FmxSQLColumnsContainer classTrait',
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLOldLocalVariable class >> annotation [

	<MSEClass: #OldLocalVariable super: #FmxSQLLocalVariable>
	<package: #FamixNGSQL>
	<generated>
	^self
]
