Class {
	#name : #FmxSQLStructuralMetamodelGenerator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'uniqueConstraint',
		'constraint',
		'reference',
		'type',
		'structuralEntity',
		'table',
		'column',
		'checkConstraint',
		'notNullConstraint',
		'tableReference',
		'namespace',
		'primaryKeyConstraint',
		'columnReference',
		'typeReference',
		'foreignKeyConstraint',
		'tQueryContainer',
		'tColumnsContainer',
		'tAbstractType',
		'tColumn',
		'tWithColumnReference',
		'tWithTableReference',
		'namespaceReference',
		'tWithNamespaceReference'
	],
	#category : #FAMIXNGSQLMetamodelGenerator
}

{ #category : #'comments - SQL' }
FmxSQLStructuralMetamodelGenerator >> checkConstraintComment [
	^ 'I represent a CHECK constraint as defined in SQL standard.'
]

{ #category : #'comments - SQL' }
FmxSQLStructuralMetamodelGenerator >> columnComment [
	^ 'I represent a Column in the relational model.'
]

{ #category : #'comments - SQL' }
FmxSQLStructuralMetamodelGenerator >> columnReferenceComment [
	^ 'I am reference to a column in a table of the model.'
]

{ #category : #'comments - SQL' }
FmxSQLStructuralMetamodelGenerator >> columnsContainerComment [
	^ 'I am an abstract super class for entities that contain columns. Two of my well-known subclasses are the table and the view.'
]

{ #category : #'comments - SQL' }
FmxSQLStructuralMetamodelGenerator >> constraintComment [
	^ 'I am an abstract superclass for constraints. A constraint restrict the possible values that can be stored in a column of a table.'
]

{ #category : #definition }
FmxSQLStructuralMetamodelGenerator >> defineClasses [
	super defineClasses.
	self defineStructuralEntities.
]

{ #category : #definition }
FmxSQLStructuralMetamodelGenerator >> defineHierarchy [
	super defineHierarchy.
	self
		defineStructuralHierarchy;
		defineStructuralReferencesHierarchy.
]

{ #category : #definition }
FmxSQLStructuralMetamodelGenerator >> defineProperties [
	super defineProperties.
	self defineStructuralReferenceProperties
]

{ #category : #definition }
FmxSQLStructuralMetamodelGenerator >> defineRelations [
	super defineRelations.
	self
		defineStructuralEntitiesRelations;
		defineStructuralTraitsRelations;
		defineStructuralReferenceEntities.
]

{ #category : #'definition - structural' }
FmxSQLStructuralMetamodelGenerator >> defineStructuralEntities [
	structuralEntity := builder
		newClassNamed: #StructuralEntity
		comment: self structuralEntityComment.
	constraint := builder
		newClassNamed: #Constraint
		comment: self constraintComment.
	constraint withTesting.
	reference := builder
		newClassNamed: #Reference
		comment: self referenceComment.
	"Concrete structural entities."
	namespace := builder
		newClassNamed: #Namespace
		comment: self namespaceComment.
	table := builder newClassNamed: #Table comment: self tableComment.
	column := builder newClassNamed: #Column comment: self columnComment.
	column withTesting.
	type := builder newClassNamed: #Type comment: self typeComment.
	checkConstraint := builder
		newClassNamed: #CheckConstraint
		comment: self checkConstraintComment.
	checkConstraint withTesting.
	primaryKeyConstraint := builder
		newClassNamed: #PrimaryKeyConstraint
		comment: self primaryKeyConstraintComment.
	primaryKeyConstraint withTesting.
	foreignKeyConstraint := builder
		newClassNamed: #ForeignKeyConstraint
		comment: self foreignKeyConstraintComment.
	foreignKeyConstraint withTesting.
	notNullConstraint := builder
		newClassNamed: #NotNullConstraint
		comment: self nullConstraintComment.
	notNullConstraint withTesting.
	uniqueConstraint := builder
		newClassNamed: #UniqueConstraint
		comment: self uniqueConstraintComment.
	uniqueConstraint withTesting.
	"Concrete reference entities."
	tableReference := builder
		newClassNamed: #TableReference
		comment: self tableReferenceComment.
	columnReference := builder
		newClassNamed: #ColumnReference
		comment: self columnReferenceComment.
	columnReference withTesting.
	typeReference := builder
		newClassNamed: #TypeReference
		comment: self typeReferenceComment.
	namespaceReference := builder 
		newClassNamed: #NamespaceReference
		comment: self namespaceReferenceComment.
]

{ #category : #'definition - structural' }
FmxSQLStructuralMetamodelGenerator >> defineStructuralEntitiesRelations [
	"A column references a type."
	(column property: #type) *- (type property: #columns).

	"A Constraint is contained in a Table."
	(table property: #constraints)
		<>-* (constraint property: #table).

	"A foreign key constraint references at least one column from another table."
	(foreignKeyConstraint property: #outgoingForeignKeyColumnReferences)
		-* (columnReference property: #foreignKeyConstraintSource) source.

	"A table eventually has inheritance sub tables and zero or one inheritance super table."
	self flag: #TODO. "Reify inheritance relation."
	(table property: #superTable)
		*- (table property: #subTables)
]

{ #category : #'definition - structural' }
FmxSQLStructuralMetamodelGenerator >> defineStructuralHierarchy [
	"Abstract entities inheritance relations."
	structuralEntity --|> namedEntity.
	structuralEntity --|> #TNamespaceEntity.
	
	constraint --|> structuralEntity.
	constraint --|> tWithColumnReference.
	
	"Concrete structural entities inheritance relations."
	namespace --|> structuralEntity.
	namespace --|> #TNamespace.
	
	table --|> structuralEntity.
	table --|> tColumnsContainer.
	table --|> tAbstractType.
	
	column --|> structuralEntity.
	column --|> tColumn.
	
	type --|> structuralEntity.
	type --|> tAbstractType.
	
	primaryKeyConstraint --|> constraint.
	foreignKeyConstraint --|> constraint.
	notNullConstraint --|> constraint.
	uniqueConstraint --|> constraint.
]

{ #category : #'definition - structural' }
FmxSQLStructuralMetamodelGenerator >> defineStructuralReferenceEntities [
	"A type reference references a type."
	(typeReference property: #type) target
		*- (type property: #references).

	"A table reference references a table."
	(tableReference property: #table) target
		*- (table property: #references).
		
	"A column reference references a column."
	(columnReference property: #column) target
		*- (column property: #references).
		
	(namespaceReference property: #namespace) target
		*- (namespace property: #references)
]

{ #category : #'definition - structural' }
FmxSQLStructuralMetamodelGenerator >> defineStructuralReferenceProperties [
	columnReference
		property: #isWildCardReference type: #Boolean
]

{ #category : #'definition - structural' }
FmxSQLStructuralMetamodelGenerator >> defineStructuralReferencesHierarchy [
	reference --|> association.
	reference --|> #TArgument.
	tableReference --|> reference.
	columnReference --|> reference.
	typeReference --|> reference.
	namespaceReference --|> reference
]

{ #category : #'definition - structural' }
FmxSQLStructuralMetamodelGenerator >> defineStructuralTraits [
	tAbstractType := builder newTraitNamed: #AbstractType.
	tColumn := builder newTraitNamed: #TColumn.
	tColumnsContainer := builder
		newTraitNamed: #ColumnsContainer
		comment: self columnsContainerComment.
	tQueryContainer := builder
		newTraitNamed: #TQueryContainer
		comment: self queryContainerComment.
	tQueryContainer withTesting.
	tWithColumnReference := builder newTraitNamed: #TWithColumnReference.
	tWithTableReference := builder newTraitNamed: #TWithTableReference.
	tWithNamespaceReference := builder newTraitNamed: #TWithNamespaceReference
]

{ #category : #'definition - structural' }
FmxSQLStructuralMetamodelGenerator >> defineStructuralTraitsRelations [
	"A columns container contains columns."
	(tColumnsContainer property: #columns)
		<>-* (tColumn property: #columnsContainer).
	(tWithColumnReference property: #outgoingColumnReferences)
		-* (columnReference property: #source) source.
	(tWithTableReference property: #outgoingTableReferences)
		-* (tableReference property: #source) source.
	(tWithNamespaceReference property: #outgoingNamespaceReference)
		-* (namespaceReference property: #source)
]

{ #category : #definition }
FmxSQLStructuralMetamodelGenerator >> defineTraits [
	super defineTraits.
	self defineStructuralTraits
]

{ #category : #'comments - SQL' }
FmxSQLStructuralMetamodelGenerator >> entityInNamespaceComment [
	^ 'I am a trait that any entity which can be part of a namespace use.'
]

{ #category : #'comments - SQL' }
FmxSQLStructuralMetamodelGenerator >> foreignKeyConstraintComment [
	^ 'I represent a FOREIGN KEY constraint as defined in SQL standard.'
]

{ #category : #'comments - SQL' }
FmxSQLStructuralMetamodelGenerator >> namespaceComment [
	^ 'I am a namespace. I hold entities to define a name scope where name duplicates are forbidden.'
]

{ #category : #'comments - SQL' }
FmxSQLStructuralMetamodelGenerator >> namespaceReferenceComment [
	^ 'I model a reference made to a namespace from source code.'
]

{ #category : #'comments - SQL' }
FmxSQLStructuralMetamodelGenerator >> nullConstraintComment [
	^ 'I represent a NOT NULL constraint as defined in SQL standard.'
]

{ #category : #'comments - SQL' }
FmxSQLStructuralMetamodelGenerator >> primaryKeyConstraintComment [
	^ 'I represent a PRIMARY KEY constraint as defined in SQL standard.'
]

{ #category : #'comments - SQL' }
FmxSQLStructuralMetamodelGenerator >> queryContainerComment [
	^ 'I am an abstract super class for behavioural entities that can contain queries in their source code.'
]

{ #category : #'comments - SQL' }
FmxSQLStructuralMetamodelGenerator >> referenceComment [
	^ 'I am an abstract object that represent a reference made to another entity in the source code a behavioural entity.'
]

{ #category : #'comments - SQL' }
FmxSQLStructuralMetamodelGenerator >> referenceContainerComment [
	^ 'I am a trait for entities containing references (storedProcedure, Clause and Alias).'
]

{ #category : #'comments - SQL' }
FmxSQLStructuralMetamodelGenerator >> structuralEntityComment [
	^ 'I am an abstract superclass for structural entities. A structural entity is an entity that defines how data are structured by the database.'
]

{ #category : #'comments - SQL' }
FmxSQLStructuralMetamodelGenerator >> tableComment [
	^ 'I represent a Table in the relational model.'
]

{ #category : #'comments - SQL' }
FmxSQLStructuralMetamodelGenerator >> tableReferenceComment [
	^ 'I am a reference to a table.'
]

{ #category : #'comments - SQL' }
FmxSQLStructuralMetamodelGenerator >> typeComment [
	^ 'I represent a Type in the database. I can be used for a column, a local variable, a parameter, etc...'
]

{ #category : #'comments - SQL' }
FmxSQLStructuralMetamodelGenerator >> typeReferenceComment [
	^ 'I am reference to a type of the model.'
]

{ #category : #'comments - SQL' }
FmxSQLStructuralMetamodelGenerator >> uniqueConstraintComment [
	^ 'I represent a UNIQUE constraint as defined in SQL standard.'
]
