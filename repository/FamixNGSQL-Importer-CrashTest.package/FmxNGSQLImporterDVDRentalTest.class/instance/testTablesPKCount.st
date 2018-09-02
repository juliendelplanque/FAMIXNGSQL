tests
testTablesPKCount
	| model |
	model := self buildModel.
	
	self assert: (self tableNamed: 'category' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'film_category' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'film' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'language' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'film_actor' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'inventory' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'rental' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'payment' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'staff' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'actor' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'customer' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'address' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'city' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'country' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'store' in: model) primaryKeyConstraints size equals: 1.