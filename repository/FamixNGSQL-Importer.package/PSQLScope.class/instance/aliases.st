accessing
aliases
	^ aliases ifNil: [ aliases := OrderedCollection new ] ifNotNil: [ aliases ]