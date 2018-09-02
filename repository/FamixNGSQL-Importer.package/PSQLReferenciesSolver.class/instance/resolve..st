accessing
resolve: aChainOfIdentifiers
	"a collection of identifier will be for example {'myTable' . 'columnA'}"
	self scopes
		do: [ :aScope | 
			[ ^ self resolve: aChainOfIdentifiers inScope: aScope ]
				on: NotFound
				do: [ "do nothing to try superior scope" ] ].
	PSQLReferenciesNotFound signal: aChainOfIdentifiers 