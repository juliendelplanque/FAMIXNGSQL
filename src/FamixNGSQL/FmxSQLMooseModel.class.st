Class {
	#name : #FmxSQLMooseModel,
	#superclass : #MooseModel,
	#category : #FamixNGSQL
}

{ #category : #initialization }
FmxSQLMooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #FmxSQLMetamodelGenerator) metamodel
]
