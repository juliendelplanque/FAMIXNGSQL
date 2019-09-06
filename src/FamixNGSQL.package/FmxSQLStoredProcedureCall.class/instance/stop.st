accessing
stop
	"Returns the last position of the stored procedure name in the source code (without parentheses and args)."
	| sourceCode |
	sourceCode := self source sourcedBelonger source copyFrom: self start to: sourceCode size.
	self flag: #TODO. "This heuristic might be wrong. We need more data in the model..."
	^ self start + sourceCode detectIndex: [ :c | c = $( ]