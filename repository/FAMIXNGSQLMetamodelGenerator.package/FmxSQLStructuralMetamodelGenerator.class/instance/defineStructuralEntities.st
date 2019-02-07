definition - structural
defineStructuralEntities
	structuralEntity := builder
		newClassNamed: #StructuralEntity
		comment: self structuralEntityComment.
	constraint := builder
		newClassNamed: #Constraint
		comment: self constraintComment.
	reference := builder
		newClassNamed: #Reference
		comment: self referenceComment.
	"Concrete structural entities."
	namespace := builder
		newClassNamed: #Namespace
		comment: self namespaceComment.
	table := builder newClassNamed: #Table comment: self tableComment.
	column := builder newClassNamed: #Column comment: self columnComment.
	type := builder newClassNamed: #Type comment: self typeComment.
	checkConstraint := builder
		newClassNamed: #CheckConstraint
		comment: self checkConstraintComment.
	primaryKeyConstraint := builder
		newClassNamed: #PrimaryKeyConstraint
		comment: self primaryKeyConstraintComment.
	foreignKeyConstraint := builder
		newClassNamed: #ForeignKeyConstraint
		comment: self foreignKeyConstraintComment.
	notNullConstraint := builder
		newClassNamed: #NotNullConstraint
		comment: self nullConstraintComment.
	uniqueConstraint := builder
		newClassNamed: #UniqueConstraint
		comment: self uniqueConstraintComment.
	"Concrete reference entities."
	tableReference := builder
		newClassNamed: #TableReference
		comment: self tableReferenceComment.
	columnReference := builder
		newClassNamed: #ColumnReference
		comment: self columnReferenceComment.
	typeReference := builder
		newClassNamed: #TypeReference
		comment: self typeReferenceComment