tests
testTablesColumnsCount
	| model |
	model := self buildModel.
	
	self assert: (self tableNamed: 'category' in: model) columns size equals: 3.
	
	self assert: (self tableNamed: 'film_category' in: model) columns size equals: 3.
	
	self assert: (self tableNamed: 'film' in: model) columns size equals: 13.
	
	self assert: (self tableNamed: 'language' in: model) columns size equals: 3.
	
	self assert: (self tableNamed: 'film_actor' in: model) columns size equals: 3.
	
	self assert: (self tableNamed: 'inventory' in: model) columns size equals: 4.
	
	self assert: (self tableNamed: 'rental' in: model) columns size equals: 7.
	
	self assert: (self tableNamed: 'payment' in: model) columns size equals: 6.
	
	self assert: (self tableNamed: 'staff' in: model) columns size equals: 11.
	
	self assert: (self tableNamed: 'actor' in: model) columns size equals: 4.
	
	self assert: (self tableNamed: 'customer' in: model) columns size equals: 10.
	
	self assert: (self tableNamed: 'address' in: model) columns size equals: 8.
	
	self assert: (self tableNamed: 'city' in: model) columns size equals: 4.
	
	self assert: (self tableNamed: 'country' in: model) columns size equals: 3.
	
	self assert: (self tableNamed: 'store' in: model) columns size equals: 4.