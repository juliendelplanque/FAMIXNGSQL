scope
useCurrentEntity: anEntity during: aBlock
	"Here we are not testing that we remove the right scope but if it's not the case, it's probably a bug"

	| entityScope |
	entityScope := self currentEntity: anEntity.
	aBlock value.
	"This assert is to check that the good scope is poped"
	self assert: self solver topScope equals: entityScope.
	self popScope.
	^ anEntity