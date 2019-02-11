convenient
find: aClass in: aCollection thenDo: aBlockClosure
	^ aCollection
		detect: [ :x | x class = aClass ]
		ifFound: [ :x | aBlockClosure cull: x ]
		ifNone: [ NotFound signalFor: aClass in: aCollection ]