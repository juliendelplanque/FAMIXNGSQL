meta-model regeneration
inheritanceTopClassesNames
	"Returns the name of classes that are on top of the inheritance tree of the meta-model."
	^ #('EntityGenerated' 'SourcedEntityGenerated' 'StructuralEntityGenerated') collect: [ :suffix |
		(self prefix , suffix) asSymbol ]