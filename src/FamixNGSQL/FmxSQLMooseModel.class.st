Class {
	#name : #FmxSQLMooseModel,
	#superclass : #MooseModel,
	#category : #FamixNGSQL
}

{ #category : #'as yet unclassified' }
FmxSQLMooseModel >> gtEntitiesIn: composite [
	"To not show all entities in model inspector"
]

{ #category : #initialization }
FmxSQLMooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #FmxSQLMetamodelGenerator) metamodel
]
