null pattern
createReferenceEntityFrom: anEntity
	^ FmxSQLReferencesGroupReference new
			referencesGroup: self;
			source: anEntity;
			yourself