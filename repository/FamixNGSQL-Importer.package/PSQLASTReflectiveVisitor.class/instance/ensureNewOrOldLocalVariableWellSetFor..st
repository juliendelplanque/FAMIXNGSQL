convenient
ensureNewOrOldLocalVariableWellSetFor: identifiers
	|localVariable |
	self assert: (self isNewOrOldIdentifier: identifiers).
	self assert: identifiers next isLast.
	localVariable := identifiers identifier = 'new'
		ifTrue: [
			self function localVariables 
				detect: [ :l | l class = FmxSQLNewLocalVariable ]
				ifNone: [ 
					(self createEntity: FmxSQLNewLocalVariable)
						name: 'new';
						parentBehaviouralEntity: self function;
						yourself ] ]
		ifFalse: [
			self function localVariables 
				detect: [ :l | l class = FmxSQLOldLocalVariable ]
				ifNone: [ 
					(self createEntity: FmxSQLOldLocalVariable)
						name: 'old';
						parentBehaviouralEntity: self function;
						yourself ] ].
	localVariable columns
		detect: [ :c | c name = identifiers next identifier ]
		ifNone: [
			(self createEntity: FmxSQLColumn)
				name: identifiers next identifier;
				columnsContainer: localVariable ]