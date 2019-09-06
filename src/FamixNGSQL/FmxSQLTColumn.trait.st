Trait {
	#name : #FmxSQLTColumn,
	#instVars : [
		'#columnsContainer => FMOne type: #FmxSQLColumnsContainer opposite: #columns'
	],
	#category : 'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLTColumn classSide >> annotation [

	<MSEClass: #TColumn super: #Trait>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLTColumn >> columnsContainer [
	"Relation named: #columnsContainer type: #FmxSQLColumnsContainer opposite: #columns"

	<generated>
	<container>
	^ columnsContainer
]

{ #category : #accessing }
FmxSQLTColumn >> columnsContainer: anObject [

	<generated>
	columnsContainer := anObject

]

{ #category : #navigation }
FmxSQLTColumn >> columnsContainerGroup [
	<generated>
	<navigation: 'ColumnsContainer'>
	^ MooseGroup with: self columnsContainer
]
