"
I model the special NEW local variable accessible from inside trigger stored procedure.
"
Class {
	#name : #FmxSQLNewLocalVariable,
	#superclass : #FmxSQLLocalVariable,
	#traits : 'FmxSQLColumnsContainer',
	#classTraits : 'FmxSQLColumnsContainer classTrait',
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLNewLocalVariable class >> annotation [

	<MSEClass: #NewLocalVariable super: #FmxSQLLocalVariable>
	<package: #FamixNGSQL>
	<generated>
	^self
]
