accessing
errorReport
	errorReport ifNil: [ errorReport := PSQParsingReport new ].
	^ errorReport