definition - structural
defineStructuralEntities
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
		comment: self typeReferenceComment