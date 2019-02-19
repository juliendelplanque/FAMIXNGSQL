*FamixNGSQL-Extensions
sourceAnchorOrReferenceGroupSourceAnchor
	^ self sourceAnchor
		ifNil: [ 
			self belongsToGroup
				ifNotNil: #sourceAnchor
				ifNil: [ nil ] ]