Trait {
	#name : #FmxSQLAbstractType,
	#instVars : [
		'#storedProceduresReturning => FMMany type: #FmxSQLStoredProcedure opposite: #returnType',
		'#localVariables => FMMany type: #FmxSQLLocalVariable opposite: #type',
		'#parameters => FMMany type: #FmxSQLParameter opposite: #type',
		'#cursorParameters => FMMany type: #FmxSQLCursorParameter opposite: #type'
	],
	#category : #'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLAbstractType classSide >> annotation [

	<MSEClass: #AbstractType super: #Trait>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLAbstractType >> cursorParameters [
	"Relation named: #cursorParameters type: #FmxSQLCursorParameter opposite: #type"

	<generated>
	^ cursorParameters
]

{ #category : #accessing }
FmxSQLAbstractType >> cursorParameters: anObject [

	<generated>
	cursorParameters value: anObject

]

{ #category : #accessing }
FmxSQLAbstractType >> localVariables [
	"Relation named: #localVariables type: #FmxSQLLocalVariable opposite: #type"

	<generated>
	^ localVariables
]

{ #category : #accessing }
FmxSQLAbstractType >> localVariables: anObject [

	<generated>
	localVariables value: anObject

]

{ #category : #accessing }
FmxSQLAbstractType >> parameters [
	"Relation named: #parameters type: #FmxSQLParameter opposite: #type"

	<generated>
	^ parameters
]

{ #category : #accessing }
FmxSQLAbstractType >> parameters: anObject [

	<generated>
	parameters value: anObject

]

{ #category : #accessing }
FmxSQLAbstractType >> storedProceduresReturning [
	"Relation named: #storedProceduresReturning type: #FmxSQLStoredProcedure opposite: #returnType"

	<generated>
	^ storedProceduresReturning
]

{ #category : #accessing }
FmxSQLAbstractType >> storedProceduresReturning: anObject [

	<generated>
	storedProceduresReturning value: anObject

]
