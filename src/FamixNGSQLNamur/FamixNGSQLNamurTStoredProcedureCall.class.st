Class {
	#name : #FamixNGSQLNamurTStoredProcedureCall,
	#superclass : #FmxTraitEntity,
	#instVars : [
		'#callingConstraints => FMOne type: #FamixNGSQLNamurTConstraint opposite: #calls',
		'#callingSelectQuery => FMOne type: #FamixNGSQLNamurTSelectQuery opposite: #calls',
		'#storedProcedure => FMOne type: #FamixNGSQLNamurTStoredProcedure opposite: #calls',
		'#callingStoredProcedure => FMOne type: #FamixNGSQLNamurTStoredProcedure opposite: #calls'
	],
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurTStoredProcedureCall class >> annotation [

	<MSEClass: #TStoredProcedureCall super: #FmxTraitEntity>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #accessing }
FamixNGSQLNamurTStoredProcedureCall >> callingConstraints [

	^ callingConstraints
]

{ #category : #accessing }
FamixNGSQLNamurTStoredProcedureCall >> callingConstraints: anObject [

	callingConstraints := anObject

]

{ #category : #accessing }
FamixNGSQLNamurTStoredProcedureCall >> callingSelectQuery [

	<container>

	^ callingSelectQuery
]

{ #category : #accessing }
FamixNGSQLNamurTStoredProcedureCall >> callingSelectQuery: anObject [

	callingSelectQuery := anObject

]

{ #category : #accessing }
FamixNGSQLNamurTStoredProcedureCall >> callingStoredProcedure [

	<container>

	^ callingStoredProcedure
]

{ #category : #accessing }
FamixNGSQLNamurTStoredProcedureCall >> callingStoredProcedure: anObject [

	callingStoredProcedure := anObject

]

{ #category : #accessing }
FamixNGSQLNamurTStoredProcedureCall >> storedProcedure [

	^ storedProcedure
]

{ #category : #accessing }
FamixNGSQLNamurTStoredProcedureCall >> storedProcedure: anObject [

	storedProcedure := anObject

]
