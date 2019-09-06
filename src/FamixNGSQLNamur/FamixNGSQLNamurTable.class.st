Class {
	#name : #FamixNGSQLNamurTable,
	#superclass : #FamixNGSQLNamurStructuralEntity,
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurTable class >> annotation [

	<MSEClass: #Table super: #FamixNGSQLNamurStructuralEntity>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #meta }
FamixNGSQLNamurTable class >> statefulTraits [

	<statefulTraits>
	^ {FamixNGSQLNamurTTable}
]
