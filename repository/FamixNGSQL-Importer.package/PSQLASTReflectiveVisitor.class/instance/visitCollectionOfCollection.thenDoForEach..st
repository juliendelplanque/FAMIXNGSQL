visiting - convenience
visitCollectionOfCollection: aCollectionOfCollectionOfNodes thenDoForEach: aBlockClosure
	aCollectionOfCollectionOfNodes do: [ :aCollectionOfNodes | self visitAll: aCollectionOfNodes thenDoForEach: aBlockClosure ]