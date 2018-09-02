tests
testTablesFKCount
	| model |
	model := self buildModel.
	
	self assert: (self tableNamed: 'category' in: model) foreignKeyConstraints size equals: 0.
	
	self assert: (self tableNamed: 'film_category' in: model) foreignKeyConstraints size equals: 2.
	
	self assert: (self tableNamed: 'film' in: model) foreignKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'language' in: model) foreignKeyConstraints size equals: 0.
	
	self assert: (self tableNamed: 'film_actor' in: model) foreignKeyConstraints size equals: 2.
	
	self assert: (self tableNamed: 'inventory' in: model) foreignKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'rental' in: model) foreignKeyConstraints size equals: 3.
	
	self assert: (self tableNamed: 'payment' in: model) foreignKeyConstraints size equals: 3.
	
	self assert: (self tableNamed: 'staff' in: model) foreignKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'actor' in: model) foreignKeyConstraints size equals: 0.
	
	self assert: (self tableNamed: 'customer' in: model) foreignKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'address' in: model) foreignKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'city' in: model) foreignKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'country' in: model) foreignKeyConstraints size equals: 0.
	
	self assert: (self tableNamed: 'store' in: model) foreignKeyConstraints size equals: 2.