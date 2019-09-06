Class {
	#name : #FamixNGSQLNamurCodeFragment,
	#superclass : #FamixNGSQLNamurEntity,
	#instVars : [
		'beginLine',
		'endColumn',
		'endLine',
		'beginColumn'
	],
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurCodeFragment class >> annotation [

	<MSEClass: #CodeFragment super: #FamixNGSQLNamurEntity>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #meta }
FamixNGSQLNamurCodeFragment class >> statefulTraits [

	<statefulTraits>
	^ {}
]

{ #category : #accessing }
FamixNGSQLNamurCodeFragment >> beginColumn [

	<MSEProperty: #beginColumn type: #Integer>
	^ beginColumn
]

{ #category : #accessing }
FamixNGSQLNamurCodeFragment >> beginColumn: anObject [

	beginColumn := anObject

]

{ #category : #accessing }
FamixNGSQLNamurCodeFragment >> beginLine [

	<MSEProperty: #beginLine type: #Integer>
	^ beginLine
]

{ #category : #accessing }
FamixNGSQLNamurCodeFragment >> beginLine: anObject [

	beginLine := anObject

]

{ #category : #accessing }
FamixNGSQLNamurCodeFragment >> endColumn [

	<MSEProperty: #endColumn type: #Integer>
	^ endColumn
]

{ #category : #accessing }
FamixNGSQLNamurCodeFragment >> endColumn: anObject [

	endColumn := anObject

]

{ #category : #accessing }
FamixNGSQLNamurCodeFragment >> endLine [

	<MSEProperty: #endLine type: #Integer>
	^ endLine
]

{ #category : #accessing }
FamixNGSQLNamurCodeFragment >> endLine: anObject [

	endLine := anObject

]
