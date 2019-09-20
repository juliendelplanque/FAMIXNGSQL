Extension { #name : #FmxSQLQualifiedReference }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLQualifiedReference >> addReference: aFmxSQLReference [
	aFmxSQLReference qualifiedReference: self.
	^ self
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLQualifiedReference >> computeSourceAnchor [
	self sourceAnchor: (
		FmxSQLEntitySourceAnchor new
			mooseModel: self references anyOne mooseModel;
			entity: self references anyOne sourceAnchor entity;
			start: self references first sourceAnchor start;
			end: self references last sourceAnchor end;
			yourself)
]
