tests
testTablesNotNullCount
	| model |
	model := self buildModel.
	
	self assert: (self tableNamed: 'category' in: model) notNullConstraints size equals: 3.
	
	self assert: (self tableNamed: 'film_category' in: model) notNullConstraints size equals: 3.
	
	self assert: (self tableNamed: 'film' in: model) notNullConstraints size equals: 8.
	
	self assert: (self tableNamed: 'language' in: model) notNullConstraints size equals: 3.
	
	self assert: (self tableNamed: 'film_actor' in: model) notNullConstraints size equals: 3.
	
	self assert: (self tableNamed: 'inventory' in: model) notNullConstraints size equals: 4.
	
	self assert: (self tableNamed: 'rental' in: model) notNullConstraints size equals: 6.
	
	self assert: (self tableNamed: 'payment' in: model) notNullConstraints size equals: 6.
	
	self assert: (self tableNamed: 'staff' in: model) notNullConstraints size equals: 8.
	
	self assert: (self tableNamed: 'actor' in: model) notNullConstraints size equals: 4.
	
	self assert: (self tableNamed: 'customer' in: model) notNullConstraints size equals: 7.
	
	self assert: (self tableNamed: 'address' in: model) notNullConstraints size equals: 6.
	
	self assert: (self tableNamed: 'city' in: model) notNullConstraints size equals: 4.
	
	self assert: (self tableNamed: 'country' in: model) notNullConstraints size equals: 3.
	
	self assert: (self tableNamed: 'store' in: model) notNullConstraints size equals: 4.