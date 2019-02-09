visit convenient
visit: nilOrNode thenDo: aBlockClosure
	^ nilOrNode ifNotNil: [ ^ aBlockClosure value: (nilOrNode acceptVisitor: self) ]