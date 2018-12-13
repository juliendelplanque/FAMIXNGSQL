accessing
errorReport
	errorReport ifNil: [ errorReport := SRParsingReport new ].
	^ errorReport