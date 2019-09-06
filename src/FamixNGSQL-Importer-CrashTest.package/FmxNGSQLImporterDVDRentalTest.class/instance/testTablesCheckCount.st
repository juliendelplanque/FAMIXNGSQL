tests
testTablesCheckCount
	| model |
	model := self buildModel.
	
	self assert: (self tableNamed: 'category' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'film_category' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'film' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'language' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'film_actor' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'inventory' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'rental' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'payment' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'staff' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'actor' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'customer' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'address' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'city' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'country' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'store' in: model) checkConstraints size equals: 0.