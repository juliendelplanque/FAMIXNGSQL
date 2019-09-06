tests
testTablesUniqueCount
	| model |
	model := self buildModel.
	
	self assert: (self tableNamed: 'category' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'film_category' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'film' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'language' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'film_actor' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'inventory' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'rental' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'payment' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'staff' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'actor' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'customer' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'address' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'city' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'country' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'store' in: model) uniqueConstraints size equals: 0.