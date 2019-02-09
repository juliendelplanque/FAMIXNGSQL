visiting - convenience
visitAll: aCollection thenDoForEach: aBlockClosure
	aCollection ifNotNil: [ aCollection do: [ :aNode | self visit: aNode thenDo: aBlockClosure ] ]