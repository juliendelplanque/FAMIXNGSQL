definition - structural
defineStructuralHierarchy
	"Abstract entities inheritance relations."
	structuralEntity --|> namedEntity.
	structuralEntity --|> #TNamespaceEntity.
	structuralEntity <|-- constraint.
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